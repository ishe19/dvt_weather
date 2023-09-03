part of 'favourites_bloc.dart';

class FavouritesState extends Equatable {
  final List<FavouriteModel> favourites;
  const FavouritesState(this.favourites);
  
  @override
  List<Object> get props => [favourites];
}
