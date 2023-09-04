
import 'package:dvt_weather/data/models/current_weather_model.dart';
import 'package:dvt_weather/domain/repository/weather_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final WeatherRepository weatherRepository;

  CurrentWeatherBloc(this.weatherRepository) : super(CurrentWeatherDataInitial()) {
    on<FetchCurrentWeatherDataEvent>((event, emit) async {
      emit(CurrentWeatherDataLoading());
      try {
        final CurrentWeatherModel weatherData = await weatherRepository
            .getCurrentForecast();
        emit(CurrentWeatherDataLoaded(weatherData));
      } catch (error) {
        debugPrint(error.toString());
        emit(CurrentWeatherDataError(error.toString()));
      }
    });
  }
}
