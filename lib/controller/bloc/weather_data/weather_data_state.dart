part of 'weather_data_bloc.dart';

sealed class WeatherForecastDataState extends Equatable {
  const WeatherForecastDataState();
  
  @override
  List<Object> get props => [];
}

class WeatherForecastDataInitial extends WeatherForecastDataState {}

class WeatherForecastDataLoading extends WeatherForecastDataState {}

class WeatherForecastDataLoaded extends WeatherForecastDataState {
  final WeatherForecastModel weatherData;

  const WeatherForecastDataLoaded(this.weatherData);

  @override
  List<Object> get props => [weatherData];

}

class WeatherForecastDataError extends WeatherForecastDataState {
  final String errorMessage;

  const WeatherForecastDataError(this.errorMessage);
}
