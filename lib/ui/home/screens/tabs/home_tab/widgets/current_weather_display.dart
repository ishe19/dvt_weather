import 'package:dvt_weather/controller/bloc/current_weather/current_weather_bloc.dart';
import 'package:dvt_weather/repository/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../data/functions.dart';
import '../../../../../constants/constants.dart';

class CurrentWeatherDisplay extends StatelessWidget {
  const CurrentWeatherDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CurrentWeatherDataLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: screenWidth(context),
                  child: Text(
                    "${kelvinToCelsius(state.currentWeather.main!.temp ?? 273.15)
                        .toStringAsFixed(0)}\u00b0",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 72),
                  )),
              Text(
                state.currentWeather.weather![0].main!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 56),
              )
            ],
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: screenWidth(context),
                child: const Text(
                  "N/A\u00b0",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 72),
                )),
            const Text(
              "No data",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 56),
            )
          ],
        );
      },
    );

  }
}



