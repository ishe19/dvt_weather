import 'package:dvt_weather/services/weather_api_service.dart';
import 'package:dvt_weather/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/weather_repository.dart';
import 'models/current_weather_model.dart';

Future<bool> isDarkPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool("isDark") != null) {
    return prefs.getBool("isDark")!;
  } else {
    return false;
  }
}

Future<String> getThemePrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("theme") != null) {
    return prefs.getString("theme")!;
  } else {
    return ImageThemes.sea.name;
  }
}

double fahrenheitToCelsius(double fahrenheit) {
  double celsius = (fahrenheit - 32) * 5 / 9;
  return celsius;
}

double kelvinToCelsius(double kelvin) {
  double celsius = kelvin - 273.15;
  return celsius;
}

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}
