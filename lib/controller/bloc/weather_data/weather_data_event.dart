part of 'weather_data_bloc.dart';


sealed class WeatherDataEvent extends Equatable {
  const WeatherDataEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherForecastEvent extends WeatherDataEvent {
  const FetchWeatherForecastEvent();
}

