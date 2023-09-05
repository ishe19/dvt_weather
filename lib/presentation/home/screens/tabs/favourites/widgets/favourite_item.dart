import 'package:dvt_weather/controller/bloc/favourites/favourites_bloc.dart';
import 'package:dvt_weather/res/functions/functions.dart';
import 'package:dvt_weather/domain/repository/weather_repository.dart';
import 'package:dvt_weather/presentation/constants/constants.dart';
import 'package:dvt_weather/presentation/home/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvt_weather/data/models/export_models.dart';

import 'favourite_dialog.dart';

class FavouriteItem extends StatefulWidget {
  final FavouriteModel favourite;

  const FavouriteItem({super.key, required this.favourite});

  @override
  State<FavouriteItem> createState() => _SearchedUpLocationTileState();
}

class _SearchedUpLocationTileState extends State<FavouriteItem> {
  WeatherRepository weatherRepository = WeatherRepository();
  bool favourite = true;
  CurrentWeatherModel currentWeather = CurrentWeatherModel();

  @override
  Widget build(BuildContext context) {
    final favouriteBloc =
        BlocProvider.of<FavouritesBloc>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          if (currentWeather.weather != null) {
            showAppDialog(
                context,
                FavouriteDetailsDialog(
                  currentWeatherModel: currentWeather,
                  name: widget.favourite.name,
                ));
          }
        },
        child: Card(
          elevation: 5,
          child: SizedBox(
            height: screenHeight(context) * 0.15,
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
                              SizedBox(
                                width: screenWidth(context) * 0.6,
                                child: Text(
                                  "Location: ${widget.favourite.name}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          CustomFutureBuilder(
                              onLoading: () {
                                return const LinearProgressIndicator();
                              },
                              future: weatherRepository.getSearchedCurrent(
                                  widget.favourite.latitude,
                                  widget.favourite.longitude),
                              onLoaded: (CurrentWeatherModel weather) {
                                currentWeather = weather;
                                return Row(
                                  children: [
                                    Text(
                                      "Current: ${kelvinToCelsius(weather.main!.temp!).toStringAsFixed(0)}$degreeString",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
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
                      onTap: () {
                        FavouriteModel favModel = FavouriteModel(
                            name: widget.favourite.name,
                            longitude: widget.favourite.longitude,
                            latitude: widget.favourite.latitude);
                        favouriteBloc.add(RemoveFavouriteEvent(favModel));
                        setState(() {
                          favourite = !favourite;
                        });
                      },
                      child: Center(
                        child: favourite
                            ? const Icon(
                                Icons.favorite_outlined,
                                size: 45,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                size: 45,
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
