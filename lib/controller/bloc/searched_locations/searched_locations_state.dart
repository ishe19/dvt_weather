part of 'searched_locations_bloc.dart';

class SearchedLocationsState extends Equatable {
  final List<SearchedUpLocation> locations;
  const SearchedLocationsState(this.locations);
  
  @override
  List<Object> get props => [locations];
}

