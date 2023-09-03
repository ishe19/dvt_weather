import 'clouds_model.dart';
import 'main_model.dart';
import 'sys_model.dart';
import 'weather_sub_model.dart';
import 'wind_model.dart';

class ForecastListElement {
  final num dt;
  final MainClass main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final num visibility;
  final num pop;
  final Sys sys;
  final String dtTxt;

  ForecastListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  factory ForecastListElement.fromJson(Map<String, dynamic> json) => ForecastListElement(
    dt: json["dt"],
    main: MainClass.fromJson(json["main"]),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    clouds: Clouds.fromJson(json["clouds"]),
    wind: Wind.fromJson(json["wind"]),
    visibility: json["visibility"],
    pop: json["pop"],
    sys: Sys.fromJson(json["sys"]),
    dtTxt: json["dt_txt"],
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "main": main.toJson(),
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "clouds": clouds.toJson(),
    "wind": wind.toJson(),
    "visibility": visibility,
    "pop": pop,
    "sys": sys.toJson(),
    "dt_txt": dtTxt,
  };
}