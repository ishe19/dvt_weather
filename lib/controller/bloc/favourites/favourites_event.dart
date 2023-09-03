part of 'favourites_bloc.dart';

sealed class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class AddFavourite extends FavouritesEvent{
  final FavouriteModel favourite;

  const AddFavourite(this.favourite);

  @override
  List<Object> get props => [favourite];
}
