import 'current_weather_model.dart';


class FavouriteModel {
  String name;
  String latitude;
  String longitude;
  CurrentWeatherModel? currentWeather;


  FavouriteModel({
    required this.name,
    required this.longitude,
    required this.latitude,
    this.currentWeather
  });

}