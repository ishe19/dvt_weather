
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'weather_ui_event.dart';
part 'weather_ui_state.dart';

class WeatherUIBloc extends Bloc<WeatherUIEvent, WeatherUIState> {
  WeatherUIBloc() : super(WeatherInitialUI()) {
    on<LoadWeatherUI>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(WeatherUISunny());
    });

    on<ChangeWeatherUI>((event, emit){
      emit(WeatherLoadingUI());
      if (event.weather.contains("cloud")) {
        emit(WeatherUICloudy());
      } else if (event.weather.contains("rain")) {
        emit(WeatherUIRainy());
      }
      // else {
      //   emit(WeatherUISunny());
      //   debugPrint("default ui");
      // }
    });
  }
}
