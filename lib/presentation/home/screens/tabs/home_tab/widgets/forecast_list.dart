
import 'package:dvt_weather/data/models/list_element_model.dart';
import 'package:dvt_weather/presentation/home/screens/tabs/home_tab/widgets/weather_forecast_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../../controller/bloc/weather_data/weather_data_bloc.dart';

class ForecastList extends StatefulWidget {
  const ForecastList({super.key});

  @override
  State<ForecastList> createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastDataBloc, WeatherForecastDataState>(
      builder: (context, state){
        if(state is WeatherForecastDataLoading){
          return const Center(child: CircularProgressIndicator());
        }
        if(state is WeatherForecastDataLoaded){
          List<ForecastListElement> items = state.weatherData.list;
        Map<String, ForecastListElement> uniqueItems = {};
        for (var item in items) {
          String currentDate = item.dtTxt.substring(0, 10);
          uniqueItems[currentDate] = item;
        }
        List<ForecastListElement> filteredList = uniqueItems.values.toList();
          return ListView.builder(
              padding: const EdgeInsets.only(bottom: 80),
            itemCount: filteredList.length,
              itemBuilder: (context, index){
            return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  duration:
                  const Duration(milliseconds: 500),
                  verticalOffset: 30.0,
                  child: WeatherForecastListItem(
                    listElement: filteredList[index],
                  ),
                ),
              );
          });
        }
       if(state is WeatherForecastDataError){
         return Center(
           child: Text("Something went wrong: ${state.errorMessage}"),
         );
       }

       return const Center(
         child: Text("Something went wrong..."),
       );
      },
    );
  }
}
