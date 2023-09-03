part of 'searched_locations_bloc.dart';

sealed class SearchedLocationsEvent extends Equatable {
  const SearchedLocationsEvent();

  @override
  List<Object> get props => [];
}

class AddLocationEvent extends SearchedLocationsEvent{
final SearchedUpLocation location;

  const AddLocationEvent(this.location);


  @override
  List<Object> get props => [location];
}
