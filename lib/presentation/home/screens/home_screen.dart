import 'package:dvt_weather/controller/bloc/app_bar_controller/app_bar_controller_bloc.dart';
import 'package:dvt_weather/domain/repository/weather_repository.dart';
import 'package:dvt_weather/presentation/constants/constants.dart';
import 'package:dvt_weather/presentation/home/widgets/drawer.dart';
import 'package:dvt_weather/presentation/home/widgets/weather_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tabs/export_tabs.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> _tabOptions = const [
    HomeTab(),
    SearchTab(),
    FavouritesTab()
  ];

  final List<NavigationDestination> _destinations = [
    NavigationDestination(
        selectedIcon: Icon(
          Icons.home,
          size: selectedIconSize,
        ),
        icon: Icon(
          Icons.home_outlined,
          size: unselectedIconSize,
        ),
        label: 'Home'),
    NavigationDestination(
        selectedIcon: Icon(
          Icons.search,
          size: selectedIconSize,
        ),
        icon: Icon(
          Icons.search_outlined,
          size: unselectedIconSize,
        ),
        label: 'Search'),
    NavigationDestination(
        selectedIcon: Icon(
          Icons.favorite,
          size: selectedIconSize,
        ),
        icon: Icon(
          Icons.favorite_border,
          size: unselectedIconSize,
        ),
        label: 'Favourites'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarControllerBloc = BlocProvider.of<AppBarControllerBloc>(context);
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: WeatherAppBar()),
        drawer: const AppDrawer(),
        bottomNavigationBar: NavigationBar(
          height: screenWidth(context) * 0.15,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
            appBarControllerBloc.add(ChangeIndexEvent(index));
          },
          destinations: _destinations,
        ),
        body: _tabOptions.elementAt(selectedIndex),
      ),
    );
  }
}
