import 'package:dvt_weather/data/models/favourite_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourites_event.dart';

part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(const FavouritesState([])) {
    on<AddFavourite>((event, emit) {
      final List<FavouriteModel> favourites = List.of(state.favourites)
        ..add(event.favourite);
      emit(FavouritesState(favourites));
    });
  }
}
