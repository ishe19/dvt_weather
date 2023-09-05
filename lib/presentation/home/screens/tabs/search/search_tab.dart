import 'package:dvt_weather/controller/bloc/searched_locations/searched_locations_bloc.dart';
import 'package:dvt_weather/data/models/export_models.dart';
import 'package:dvt_weather/presentation/constants/constants.dart';
import 'package:dvt_weather/presentation/home/screens/tabs/search/widgets/searched_up_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab>
    with AutomaticKeepAliveClientMixin<SearchTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final searchedLocationsBloc =
        BlocProvider.of<SearchedLocationsBloc>(context, listen: false);
    return SizedBox(
        height: screenHeight(context),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: FlutterLocationPicker(
                  selectLocationButtonText: "Add Current Location",
                  initZoom: 11,
                  minZoomLevel: 5,
                  maxZoomLevel: 16,
                  trackMyPosition: true,
                  onPicked: (pickedData) {
                    SearchedUpLocation location = SearchedUpLocation(
                        name: pickedData.address,
                        longitude: "${pickedData.latLong.longitude}",
                        latitude: "${pickedData.latLong.latitude}");
                    searchedLocationsBloc.add(AddLocationEvent(location));
                  }),
            ),
            Expanded(
              flex: 1,
              child: BlocBuilder<SearchedLocationsBloc, SearchedLocationsState>(
                builder: (context, state) {
                  return state.locations.isNotEmpty? ListView.builder(
                    padding: const EdgeInsets.only(bottom: 15),
                    itemCount: state.locations.length,
                    itemBuilder: (context, index) {
                      return SearchedUpLocationTile(
                        location: state.locations[index],
                      );
                    },
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenWidth(context) * 0.3,
                        width: screenWidth(context) * 0.3,
                        child: SvgPicture.asset(
                          "assets/svg/search.svg",
                        ),
                      ),
                      addVerticalHeight(10),
                      Text("No Locations...")
                    ],
                  );
                },
              ),
            )
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
