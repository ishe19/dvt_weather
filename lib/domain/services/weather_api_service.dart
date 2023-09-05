import 'package:dio/dio.dart';
import 'package:dvt_weather/res/constants/api_key.dart';
import 'package:dvt_weather/res/constants/functions.dart';
import 'package:dvt_weather/data/models/current_weather_model.dart';
import 'package:dvt_weather/data/models/weather_model.dart';
import 'package:geolocator/geolocator.dart';



class WeatherService {
  final Dio dio = Dio();

  final String baseApiUrl = "https://api.openweathermap.org/data/2.5";

  var header = {
    'Content-type': 'application/json; charset=utf-8',
  };

  Future<WeatherForecastModel> getFiveDayForecast() async {
    late Position position;

    try {
      position = await determinePosition();
    } catch (e) {
      rethrow;
    }

    Map<String, String> parameters = {
      "lat": "${position.latitude}",
      "lon": "${position.longitude}",
      "appid": apiKey
    };

    String url = "$baseApiUrl/forecast";

    try {
      final response = await dio.get(url,
          queryParameters: parameters, options: Options(headers: header));

      if (response.statusCode == 200) {
        return WeatherForecastModel.fromJson(response.data);
      } else {
        throw Exception(
            "Response failed with status code ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<CurrentWeatherModel> getCurrentForecast() async {
    late Position position;

    try {
      position = await determinePosition();
    } catch (e) {
      rethrow;
    }

    try {
      Map<String, String> parameters = {
        "lat": "${position.latitude}",
        "lon": "${position.longitude}",
        "appid": apiKey
      };

      String url = "$baseApiUrl/weather";
      final response = await dio.get(url,
          queryParameters: parameters, options: Options(headers: header));
      if (response.statusCode == 200) {
        return CurrentWeatherModel.fromJson(response.data);
      } else {
        throw Exception(
            "Response failed with status code ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<CurrentWeatherModel> getSearchedCurrent(
      String latitude, String longitude) async {
    try {
      Map<String, String> parameters = {
        "lat": latitude,
        "lon": longitude,
        "appid": apiKey
      };
      String url = "$baseApiUrl/weather";
      final response = await dio.get(url,
          queryParameters: parameters, options: Options(headers: header));
      if (response.statusCode == 200) {
        return CurrentWeatherModel.fromJson(response.data);
      } else {
        throw Exception(
            "Response failed with status code ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
