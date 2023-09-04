import 'package:dvt_weather/controller/bloc/current_weather/current_weather_bloc.dart';
import 'package:dvt_weather/res/functions/functions.dart';
import 'package:dvt_weather/presentation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWeatherItem extends StatefulWidget {
  const CurrentWeatherItem({super.key});

  @override
  State<CurrentWeatherItem> createState() => _CurrentWeatherItemState();
}

class _CurrentWeatherItemState extends State<CurrentWeatherItem> {
  late CurrentWeatherBloc currentWeatherBloc;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CurrentWeatherDataLoaded) {
          return SizedBox(
            height: screenWidth(context) * 0.15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  weatherData(
                      kelvinToCelsius(state.currentWeather.main!.tempMin!)
                          .toStringAsFixed(0),
                      "min"),
                  weatherData(
                      kelvinToCelsius(state.currentWeather.main!.temp!)
                          .toStringAsFixed(0),
                      "Current"),
                  weatherData(
                      kelvinToCelsius(state.currentWeather.main!.tempMax!)
                          .toStringAsFixed(0),
                      "max"),
                ],
              ),
            ),
          );
        }
        return SizedBox(
          height: screenWidth(context) * 0.15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                weatherData("N/A", "min"),
                weatherData("N/A", "Current"),
                weatherData("N/A", "max"),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget weatherData(String temp, String type) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Align(
          alignment: Alignment.center,
          child: Text(
            "$temp\u00b0",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )),
      Text(
        type,
        style: const TextStyle(fontSize: 16),
      )
    ],
  );
}
