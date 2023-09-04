import 'package:dvt_weather/data/models/current_weather_model.dart';
import 'package:dvt_weather/data/models/weather_model.dart';
import 'package:dvt_weather/services/weather_api_service.dart';

class WeatherRepository {
  final WeatherService _weatherService = WeatherService();

  Future<WeatherForecastModel> getFiveDayForecast() async {
    return _weatherService.getFiveDayForecast();
  }

  Future<CurrentWeatherModel> getCurrentForecast() async {
    return _weatherService.getCurrentForecast();
  }

  Future<CurrentWeatherModel> getSearchedCurrent(String latitude, String longitude) async {
    return _weatherService.getSearchedCurrent(latitude, longitude);
  }
}
