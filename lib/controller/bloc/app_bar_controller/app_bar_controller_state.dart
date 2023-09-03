part of 'app_bar_controller_bloc.dart';

class AppBarControllerState extends Equatable {
  final int index;
  const AppBarControllerState(this.index);
  
  @override
  List<Object> get props => [index];
}