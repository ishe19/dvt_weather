import 'package:dvt_weather/controller/bloc/current_weather/current_weather_bloc.dart';
import 'package:dvt_weather/controller/bloc/weather_data/weather_data_bloc.dart';
import 'package:dvt_weather/controller/bloc/weather_ui/weather_ui_bloc.dart';
import 'package:dvt_weather/controller/cubit/bg_image/bg_image_theme_cubit.dart';
import 'package:dvt_weather/controller/cubit/theme/theme_cubit.dart';
import 'package:dvt_weather/domain/repository/weather_repository.dart';
import 'package:dvt_weather/presentation/constants/constants.dart';
import 'package:dvt_weather/res/colors/colors.dart';
import 'package:dvt_weather/presentation/home/screens/tabs/home_tab/widgets/current_weather_tile.dart';
import 'package:dvt_weather/presentation/home/screens/tabs/home_tab/widgets/forecast_list.dart';
import 'package:dvt_weather/res/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab>
    with AutomaticKeepAliveClientMixin<HomeTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bgImageTheme =
        BlocProvider.of<BgImageThemeCubit>(context, listen: true);
    final themeCubit = BlocProvider.of<ThemeCubit>(context, listen: false);
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentWeatherBloc>(
          create: (context) => CurrentWeatherBloc(
              RepositoryProvider.of<WeatherRepository>(context))
            ..add(const FetchCurrentWeatherDataEvent()),
        ),
        BlocProvider<WeatherForecastDataBloc>(
            create: (context) => WeatherForecastDataBloc(
                  RepositoryProvider.of<WeatherRepository>(context),
                )..add(const FetchWeatherForecastEvent())),
      ],
      child: Scaffold(
        body: SizedBox(
          height: screenHeight(context),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    MultiBlocListener(
                      listeners: [
                        BlocListener<CurrentWeatherBloc, CurrentWeatherState>(
                          listener: (context, state) {
                            if (state is CurrentWeatherDataLoaded) {
                              BlocProvider.of<WeatherUIBloc>(context).add(
                                  ChangeWeatherUI(state.currentWeather
                                      .weather![0].description!));
                              if(state.currentWeather
                                  .weather![0].description!.contains("cloud") || state.currentWeather
                                  .weather![0].description!.contains("cloud") ){
                                themeCubit.changeTheme(true);
                              } else{
                                themeCubit.changeTheme(false);
                              }
                            }
                          },
                        ),
                      ],
                      child: BlocBuilder<WeatherUIBloc, WeatherUIState>(
                        builder: (context, state) {
                          if (state is WeatherUISunny) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(bgImageTheme.imageTheme ==
                                        ImageThemes.sea.name
                                    ? "assets/images/sea_sunny.png"
                                    : "assets/images/forest_sunny.png"),
                                fit: BoxFit.cover,
                              )),
                            );
                          } else if (state is WeatherUICloudy) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(bgImageTheme.imageTheme ==
                                        ImageThemes.sea.name
                                    ? "assets/images/sea_cloudy.png"
                                    : "assets/images/forest_cloudy.png"),
                                fit: BoxFit.cover,
                              )),
                            );
                          } else if (state is WeatherUIRainy) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(bgImageTheme.imageTheme ==
                                        ImageThemes.sea.name
                                    ? "assets/images/sea_rainy.png"
                                    : "assets/images/forest_rainy.png"),
                                fit: BoxFit.cover,
                              )),
                            );
                          } else {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(bgImageTheme.imageTheme ==
                                        ImageThemes.sea.name
                                    ? "assets/images/sea_sunny.png"
                                    : "assets/images/forest_sunny.png"),
                                fit: BoxFit.cover,
                              )),
                            );
                          }
                        },
                      ),
                    ),
                    // const CurrentWeatherDisplay(),

                    BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                      builder: (context, state) {
                        if (state is CurrentWeatherDataLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is CurrentWeatherDataLoaded) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: screenWidth(context),
                                  child: Text(
                                    "${kelvinToCelsius(state.currentWeather.main!.temp ?? 273.15).toStringAsFixed(0)}\u00b0",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 72),
                                  )),
                              Text(
                                state.currentWeather.weather![0].main!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 56),
                              )
                            ],
                          );
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth(context),
                                child: const Text(
                                  "N/A\u00b0",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 72),
                                )),
                            const Text(
                              "No data",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 56),
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<WeatherUIBloc, WeatherUIState>(
                  builder: (context, state) {
                    Color containerColor;
                    if (state is WeatherUISunny) {
                      containerColor = sunny;
                    } else if (state is WeatherUICloudy) {
                      containerColor = cloudy;
                    } else if (state is WeatherUIRainy) {
                      containerColor = rainy;
                    } else {
                      containerColor = sunny; // Default color
                    }

                    return Container(
                      height: screenHeight(context) * 0.5,
                      decoration: BoxDecoration(
                        color: containerColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CurrentWeatherItem(),
                          const Divider(
                            color: secondary,
                          ),
                          Expanded(
                            child: BlocBuilder<CurrentWeatherBloc,
                                CurrentWeatherState>(
                              builder: (context, state) {
                                if (state is CurrentWeatherDataLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state is CurrentWeatherDataLoaded) {
                                  return const ForecastList();
                                }
                                return const Center(
                                  child: Icon(Icons.error),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
