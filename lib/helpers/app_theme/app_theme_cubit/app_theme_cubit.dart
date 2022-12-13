//

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../safe/safe.dart';
import '../app_theme.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<ThemeState> {
  final Safe safe;
  AppThemeCubit({required this.safe})
      : super(ThemeState(themeMode: safe.getThemeMode())) {
    updateAppTheme();
  }

  void updateAppTheme() {
    // final Brightness currentBrightness = AppTheme.getSystemBrightness();
    // currentBrightness == Brightness.light
    //     ? setTheme(ThemeMode.light)
    //     : setTheme(ThemeMode.dark);
    setTheme(safe.getThemeMode());
  }

  void setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarAndNavigationBarColor(themeMode);
    safe.setThemeMode(themeMode == ThemeMode.dark ? 'dark' : 'light');
    emit(ThemeState(themeMode: themeMode));
  }
}
