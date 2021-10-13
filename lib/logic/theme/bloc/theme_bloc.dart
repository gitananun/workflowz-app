import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final FlutterSecureStorage storage;
  ThemeBloc({required this.storage}) : super(ThemeInitial());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    /// Start Switching according to device
    if (event is ThemeLoadStarted) {
      if (await storage.containsKey(key: 'themeMode')) {
        final String? _themeMode = await storage.read(key: 'themeMode');

        yield state.copyWith(themeMode: _themeMode == 'dark' ? ThemeMode.dark : ThemeMode.light);
      } else {
        final brightness = SchedulerBinding.instance?.window.platformBrightness;

        await storage.write(key: 'themeMode', value: brightness == Brightness.dark ? 'dark' : 'light');

        yield state.copyWith(
          themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
        );
      }
    }

    /// Manual Switching
    else if (event is ThemeSwitched) {
      await storage.write(key: 'themeMode', value: event.darkModeEnabled ? 'dark' : 'light');

      yield state.copyWith(themeMode: event.darkModeEnabled ? ThemeMode.dark : ThemeMode.light);
    }
  }
}
