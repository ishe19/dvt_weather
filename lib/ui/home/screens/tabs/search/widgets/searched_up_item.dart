import 'package:dvt_weather/data/functions.dart';
import 'package:dvt_weather/data/models/current_weather_model.dart';
import 'package:dvt_weather/data/models/searched_up_locations.dart';
import 'package:dvt_weather/repository/weather_repository.dart';
import 'package:dvt_weather/res/colors/colors.dart';
import 'package:dvt_weather/ui/constants/constants.dart';
import 'package:dvt_weather/ui/home/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';

class SearchedUpLocationTile extends StatefulWidget {
  final SearchedUpLocation location;

  const SearchedUpLocationTile({super.key, required this.location});

  @override
  State<SearchedUpLocationTile> createState() => _SearchedUpLocationTileState();
}

class _SearchedUpLocationTileState extends State<SearchedUpLocationTile> {
  WeatherRepository weatherRepository = WeatherRepository();
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        color: secondary,
        child: SizedBox(
          height: screenHeight(context) * 0.1,
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Location: ${widget.location.name}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        CustomFutureBuilder(
                          onLoading: (){
                            return const LinearProgressIndicator();
                          },
                            future: weatherRepository.getSearchedCurrent(
                                widget.location.latitude,
                                widget.location.longitude),
                            onLoaded: (CurrentWeatherModel weather) {
                              return Row(
                                children: [
                                  Text(
                                    "Current: ${kelvinToCelsius(weather.main!.temp!).toStringAsFixed(0)}",
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              );
                            })
                      ],
                    ),
                  )),
               Expanded(
                flex: 1,
                child: SizedBox(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        favourite = !favourite;
                      });
                    },
                    child: Center(
                      child: favourite? const Icon(Icons.favorite_outlined, size: 45, color: complimentary,) : const Icon(Icons.favorite_border, size: 45,),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
