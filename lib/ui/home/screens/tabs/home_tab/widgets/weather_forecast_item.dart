
import 'package:dvt_weather/data/functions.dart';
import 'package:dvt_weather/data/models/list_element_model.dart';
import 'package:dvt_weather/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherForecastListItem extends StatelessWidget {
  final ForecastListElement listElement;
  const WeatherForecastListItem({super.key, required this.listElement});

  String convertDateString(String dateString){
    DateTime dateTime = DateTime.parse(dateString);
    String dayName = DateFormat.EEEE().format(dateTime);

    return dayName;

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: SizedBox(
        height: screenWidth(context) * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(convertDateString(listElement.dtTxt), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20), )),
            Expanded(child: weatherIcon(listElement.weather[0].main)),
            Expanded(child: Text("${kelvinToCelsius(listElement.main.temp).toStringAsFixed(0)}\u00b0",
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ))
          ],
        ),
      ),
    );
  }
}


Widget weatherIcon(String weather){
  String asset = "";
  switch(weather){
    case "Clear":
      asset = "assets/icons/clear@3x.png";
    case "Clouds":
      asset = "assets/icons/partlysunny@3x.png";
    case "Rain":
      asset = "assets/icons/partlysunny@3x.png";
    default:
      asset = "assets/icons/rain@3x.png";
  }

  return SizedBox(
    child: Image.asset(asset,
      fit: BoxFit.contain,
    ),
  );
}



