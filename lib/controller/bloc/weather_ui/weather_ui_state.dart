part of 'weather_ui_bloc.dart';

@immutable
sealed class WeatherUIState extends Equatable {
  @override
  List<Object> get props => [];
}

final class WeatherInitialUI extends WeatherUIState {}

final class WeatherLoadingUI extends WeatherUIState {}

final class WeatherUISunny extends WeatherUIState {}

final class WeatherUICloudy extends WeatherUIState {}

final class WeatherUIRainy extends WeatherUIState {}
