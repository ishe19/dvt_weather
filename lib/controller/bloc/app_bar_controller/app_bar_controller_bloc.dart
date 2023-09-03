
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_bar_controller_event.dart';
part 'app_bar_controller_state.dart';

class AppBarControllerBloc extends Bloc<AppBarControllerEvent, AppBarControllerState> {
  AppBarControllerBloc() : super(const AppBarControllerState(0)) {
    on<ChangeIndexEvent>((event, emit) {
      emit(AppBarControllerState(event.index));
    });
  }
}
