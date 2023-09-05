import 'package:dvt_weather/controller/bloc/favourites/favourites_bloc.dart';
import 'package:dvt_weather/res/functions/functions.dart';
import 'package:dvt_weather/domain/repository/weather_repository.dart';
import 'package:dvt_weather/presentation/constants/constants.dart';
import 'package:dvt_weather/presentation/home/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvt_weather/data/models/export_models.dart';

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
    final favouriteBloc =
        BlocProvider.of<FavouritesBloc>(context, listen: true);
    for (FavouriteModel fav in favouriteBloc.state.favourites) {
      if (fav.name == widget.location.name) {
        setState(() {
          favourite = true;
        });
      }
    }
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        // color: accent.withOpacity(0.8),
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
                            SizedBox(
                              width: screenWidth(context) * 0.7,
                              child: Text(
                                "Location: ${widget.location.name}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        CustomFutureBuilder(
                            onLoading: () {
                              return const LinearProgressIndicator();
                            },
                            future: weatherRepository.getSearchedCurrent(
                                widget.location.latitude,
                                widget.location.longitude),
                            onLoaded: (CurrentWeatherModel weather) {
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
                          name: widget.location.name,
                          longitude: widget.location.longitude,
                          latitude: widget.location.latitude);

                      favourite =
                          favouriteBloc.state.favourites.contains(favModel);

                      favouriteBloc.state.favourites.contains(favModel)
                          ? favouriteBloc.add(RemoveFavouriteEvent(favModel))
                          : favouriteBloc.add(AddFavourite(favModel));
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
    );
  }
}
