
import 'package:dvt_weather/data/models/searched_up_locations.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searched_locations_event.dart';
part 'searched_locations_state.dart';

class SearchedLocationsBloc extends Bloc<SearchedLocationsEvent, SearchedLocationsState> {
  SearchedLocationsBloc() : super(const SearchedLocationsState( [])) {
    on<AddLocationEvent>((event, emit) {
      final List<SearchedUpLocation> locations = List.of(state.locations)..add(event.location);
      emit(SearchedLocationsState(locations));
    });
  }
}
