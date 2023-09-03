part of 'bg_image_theme_cubit.dart';

@immutable
sealed class BgImageThemeState {}

final class BgImageThemeInitial extends BgImageThemeState {}

final class BgImageThemeChanged extends BgImageThemeState {}

