import 'package:dvt_weather/controller/bloc/app_bar_controller/app_bar_controller_bloc.dart';
import 'package:dvt_weather/ui/home/screens/tabs/search/widgets/seearch_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favourites_app_bar.dart';
import '../screens/tabs/home_tab/widgets/home_app_bar.dart';



class WeatherAppBar extends StatefulWidget {
  const WeatherAppBar({Key? key}) : super(key: key);

  @override
  State<WeatherAppBar> createState() => _WeatherAppBarState();
}

class _WeatherAppBarState extends State<WeatherAppBar> {

  final List<Widget> appBars = [
    const HomeAppBar(),
    const SearchAppBar(),
    const FavouritesAppBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarControllerBloc, AppBarControllerState>(builder: (context, state){
      return appBars.elementAt(state.index);
    });
  }
}