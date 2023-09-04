import 'package:dvt_weather/presentation/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bg_image_theme_state.dart';

class BgImageThemeCubit extends Cubit<BgImageThemeState> {
  BgImageThemeCubit() : super(BgImageThemeInitial());

  String _imageTheme = ImageThemes.sea.name;
  String get imageTheme => _imageTheme;

  void changeTheme(String value) {
    _imageTheme = value;
    emit(BgImageThemeChanged());
  }
}
