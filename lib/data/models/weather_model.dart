import 'dart:convert';

import 'city_model.dart';
import 'list_element_model.dart';

class WeatherForecastModel {
  final String cod;
  final num message;
  final num cnt;
  final List<ForecastListElement> list;
  final City city;

  WeatherForecastModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) => WeatherForecastModel(
    cod: json["cod"],
    message: json["message"],
    cnt: json["cnt"],
    list: List<ForecastListElement>.from(json["list"].map((x) => ForecastListElement.fromJson(x))),
    city: City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "cod": cod,
    "message": message,
    "cnt": cnt,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "city": city.toJson(),
  };
}










