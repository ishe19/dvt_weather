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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          currentWeather == other.currentWeather;

  @override
  int get hashCode =>
      name.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      currentWeather.hashCode;

  @override
  String toString() {
    return 'FavouriteModel{name: $name, latitude: $latitude, longitude: $longitude, currentWeather: $currentWeather}';
  }
}