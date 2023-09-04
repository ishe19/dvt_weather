import 'package:dvt_weather/presentation/home/screens/home_screen.dart';
import 'package:dvt_weather/presentation/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
    case SettingsScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SettingsScreen());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>  Scaffold(
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: SvgPicture.asset(
                      "'assets/svg/not_found.svg'",
                    ),
                  ),
                  const Text("Screen does not exist."),
                ],
              ),
            ),
          ));
  }
}