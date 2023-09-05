import 'package:dvt_weather/res/colors/colors.dart';
import 'package:dvt_weather/presentation/constants/constants.dart';
import 'package:dvt_weather/res/constants/functions.dart';
import 'package:flutter/material.dart';
import 'package:dvt_weather/data/models/export_models.dart';

class FavouriteDetailsDialog extends StatelessWidget {
  final CurrentWeatherModel currentWeatherModel;
  final String name;

  const FavouriteDetailsDialog(
      {super.key, required this.currentWeatherModel, required this.name});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Weather Details'),
      content: SizedBox(
        height: screenHeight(context) * 0.5,
        child: Column(
          children: [
            rowItem("Name: ", name),
            const Divider(
              color: complimentary,
            ),
            rowItem("Minimum: ",
                "${kelvinToCelsius(currentWeatherModel.main!.tempMin!).toStringAsFixed(0)}$degreeString"),
            addVerticalHeight(5),
            rowItem("Temperature: ",
                "${kelvinToCelsius(currentWeatherModel.main!.temp!).toStringAsFixed(0)}$degreeString"),
            addVerticalHeight(5),
            rowItem("Maximum: ",
                "${kelvinToCelsius(currentWeatherModel.main!.tempMax!).toStringAsFixed(0)}$degreeString"),
            addVerticalHeight(5),
            rowItem("Maximum: ",
                "${kelvinToCelsius(currentWeatherModel.main!.tempMax!).toStringAsFixed(0)}$degreeString"),
            addVerticalHeight(5),

            rowItem("Feels like: ",
                "${kelvinToCelsius(currentWeatherModel.main!.feelsLike!).toStringAsFixed(0)}$degreeString"),
            addVerticalHeight(5),

            rowItem("Humidity: ",
                "${currentWeatherModel.main!.humidity!.toStringAsFixed(0)}g/kg"),
            addVerticalHeight(5),

            rowItem("Sea level: ",
                "${currentWeatherModel.main!.seaLevel!.toStringAsFixed(0)} MAMSL"),
            addVerticalHeight(5),

            rowItem("Ground level: ",
                currentWeatherModel.main!.grndLevel!.toStringAsFixed(0)),
            addVerticalHeight(5),

            rowItem("Description: ",
                currentWeatherModel.weather![0].description!),
            addVerticalHeight(5),

            rowItem("Wind: ",
                "${currentWeatherModel.wind!.speed.toString()}m/s"),
            addVerticalHeight(5),

            rowItem("Visibility: ",
                "${currentWeatherModel.visibility!}"),
            addVerticalHeight(5),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

Widget rowItem(String title, String data) {
  return Row(
    children: [
      Expanded(child: Text(title)),
      Expanded(
          child: Text(
        data,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.end,
        maxLines: 4,
      ))
    ],
  );
}
