import 'package:dvt_weather/controller/cubit/bg_image/bg_image_theme_cubit.dart';
import 'package:dvt_weather/controller/bloc/export_blocs.dart';
import 'package:dvt_weather/controller/cubit/theme/theme_cubit.dart';
import 'package:dvt_weather/domain/repository/weather_repository.dart';
import 'package:dvt_weather/router.dart';
import 'package:dvt_weather/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ThemeCubit()),
      BlocProvider(create: (context) => BgImageThemeCubit()),
      BlocProvider(create: (context) => WeatherUIBloc()),
      BlocProvider(
          create: (context) => WeatherForecastDataBloc(WeatherRepository())),
      BlocProvider(create: (context) => CurrentWeatherBloc(WeatherRepository())),
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
