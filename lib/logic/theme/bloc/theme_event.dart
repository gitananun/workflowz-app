part of 'theme_bloc.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeLoadStarted extends ThemeEvent {}

class ThemeSwitched extends ThemeEvent {
  final bool darkModeEnabled;

  const ThemeSwitched({required this.darkModeEnabled});
}
