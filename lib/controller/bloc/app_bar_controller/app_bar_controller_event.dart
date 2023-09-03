part of 'app_bar_controller_bloc.dart';

sealed class AppBarControllerEvent extends Equatable {
  const AppBarControllerEvent();

  @override
  List<Object> get props => [];
}

class ChangeIndexEvent extends AppBarControllerEvent {
  final int index;

  const ChangeIndexEvent(this.index);

  @override
  List<Object> get props => [];
}
