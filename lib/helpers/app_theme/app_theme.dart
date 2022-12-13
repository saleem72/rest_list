//

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static const primary = Color(0xFFE7A968);
  static final primarySwatch = primary.toMaterialColor();
  static const background = Color(0xFFEFEFEF);

  static const String fontFamily = 'Lato';

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: primary.toMaterialColor(),
    fontFamily: 'Almarai',
    scaffoldBackgroundColor: background,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.compact,
    fontFamily: 'Almarai',
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      background: Color(0xff1a1c1e),
      error: Color(0xffffb4ab),
      errorContainer: Color(0xff93000a),
      inversePrimary: Color(0xff0061a4),
      inverseSurface: Color(0xffe2e2e6),
      onBackground: Color(0xffe2e2e6),
      onError: Color(0xff690005),
      onErrorContainer: Color(0xffffb4ab),
      onInverseSurface: Color(0xff2f3033),
      onPrimary: Color(0xff003258),
      onPrimaryContainer: Color(0xffd1e4ff),
      onSecondary: Color(0xff253140),
      onSecondaryContainer: Color(0xffd7e3f7),
      onSurface: Color(0xffe2e2e6),
      onSurfaceVariant: Color(0xffc3c7cf),
      onTertiary: Color(0xff3b2948),
      onTertiaryContainer: Color(0xfff2daff),
      outline: Color(0xff8d9199),
      primary: Color(0xff9ecaff),
      primaryContainer: Color(0xff00497d),
      secondary: Color(0xffbbc7db),
      secondaryContainer: Color(0xff3b4858),
      shadow: Color(0xff000000),
      surface: Color(0xff1a1c1e),
      surfaceTint: Color(0xff9ecaff),
      surfaceVariant: Color(0xff43474e),
      tertiary: Color(0xffd6bee4),
      tertiaryContainer: Color(0xff523f5f),
    ),
    scaffoldBackgroundColor: const Color(0xff1a1c1e),
    secondaryHeaderColor: const Color(0xff616161),
    selectedRowColor: const Color(0xfff5f5f5),
    shadowColor: const Color(0xff000000),
  );

  static Brightness getSystemBrightness() =>
      SchedulerBinding.instance.window.platformBrightness;

  static void setStatusBarAndNavigationBarColor(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? lightTheme.secondaryHeaderColor
          : darkTheme.secondaryHeaderColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

extension _Material on Color {
  Map<int, Color> _toSwatch() => {
        50: withOpacity(0.1),
        100: withOpacity(0.2),
        200: withOpacity(0.3),
        300: withOpacity(0.4),
        400: withOpacity(0.5),
        500: withOpacity(0.6),
        600: withOpacity(0.7),
        700: withOpacity(0.8),
        800: withOpacity(0.9),
        900: this,
      };

  MaterialColor toMaterialColor() => MaterialColor(
        value,
        _toSwatch(),
      );

  MaterialAccentColor toMaterialAccentColor() => MaterialAccentColor(
        value,
        _toSwatch(),
      );
}
