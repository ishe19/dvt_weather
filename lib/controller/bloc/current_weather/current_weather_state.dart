part of 'current_weather_bloc.dart';

sealed class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();
  
  @override
  List<Object> get props => [];
}

class CurrentWeatherDataInitial extends CurrentWeatherState {}

class CurrentWeatherDataLoading extends CurrentWeatherState {}

class CurrentWeatherDataLoaded extends CurrentWeatherState {
  final CurrentWeatherModel currentWeather;

  const CurrentWeatherDataLoaded(this.currentWeather);

  @override
  List<Object> get props => [currentWeather];
}

class CurrentWeatherDataError extends CurrentWeatherState {
  final String errorMessage;

  const CurrentWeatherDataError(this.errorMessage);
}
