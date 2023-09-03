part of 'weather_ui_bloc.dart';

@immutable
sealed class WeatherUIEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class LoadWeatherUI extends WeatherUIEvent {}

class ChangeWeatherUI extends WeatherUIEvent {
  final String weather;

   ChangeWeatherUI(this.weather);

  @override
  List<Object?> get props => [weather];
}
