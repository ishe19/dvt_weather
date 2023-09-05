import 'package:dvt_weather/controller/bloc/app_bar_controller/app_bar_controller_bloc.dart';
import 'package:dvt_weather/controller/bloc/favourites/favourites_bloc.dart';
import 'package:dvt_weather/controller/bloc/searched_locations/searched_locations_bloc.dart';
import 'package:dvt_weather/controller/bloc/weather_data/weather_data_bloc.dart';
import 'package:dvt_weather/controller/bloc/weather_ui/weather_ui_bloc.dart';
import 'package:dvt_weather/controller/cubit/bg_image/bg_image_theme_cubit.dart';

import 'package:dvt_weather/controller/cubit/theme/theme_cubit.dart';
import 'package:dvt_weather/domain/repository/weather_repository.dart';
import 'package:dvt_weather/router.dart';
import 'package:dvt_weather/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'controller/bloc/current_weather/current_weather_bloc.dart';

void main() {
  WeatherRepository weatherRepository = WeatherRepository();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ThemeCubit()),
      BlocProvider(create: (context) => BgImageThemeCubit()),
      BlocProvider(create: (context) => WeatherUIBloc()),
      BlocProvider(
          create: (context) => WeatherForecastDataBloc(weatherRepository)),
      BlocProvider(create: (context) => CurrentWeatherBloc(weatherRepository)),
      BlocProvider(create: (context) => AppBarControllerBloc()),
      BlocProvider(create: (context) => SearchedLocationsBloc()),
      BlocProvider(create: (context) => FavouritesBloc()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return MaterialApp(
      title: 'DVT Weather',
      theme: theme.isDark
          ? ThemeData.dark(
              useMaterial3: true,
            )
          : ThemeData.light(
              useMaterial3: true,
            ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const SplashScreen(),
    );
  }
}
