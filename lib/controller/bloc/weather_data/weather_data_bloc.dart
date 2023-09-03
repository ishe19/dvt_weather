import 'package:dvt_weather/data/models/weather_model.dart';
import 'package:dvt_weather/repository/weather_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_data_event.dart';

part 'weather_data_state.dart';

class WeatherForecastDataBloc
    extends Bloc<WeatherDataEvent, WeatherForecastDataState> {
  final WeatherRepository weatherRepository;

  WeatherForecastDataBloc(this.weatherRepository)
      : super(WeatherForecastDataInitial()) {
    on<FetchWeatherForecastEvent>((event, emit) async {
      emit(WeatherForecastDataLoading());
      try {
        final weatherData = await weatherRepository.getFiveDayForecast();
        emit(WeatherForecastDataLoaded(weatherData));
      } catch (error) {
        debugPrint("Error fetching weather forecast data: $error");
        emit(WeatherForecastDataError(error.toString()));
      }
    });
  }
}
