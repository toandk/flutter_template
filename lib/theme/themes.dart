import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_template/theme/colors.dart';

class AppThemes {
  final String _sThemeModeKey = 'S_THEME_MODE_KEY';
  final String _sThemeModeLight = '_sThemeModeLight';
  final String _sThemeModeDark = '_sThemeModeDark';

  static const String _normalFont = "Roboto";
  static const String _semiboldFont = "RobotoMedium";
  static ThemeData instance = _lightTheme;

  // LIGHT THEME TEXT
  static const TextTheme _lightTextTheme = TextTheme(
    headline1: TextStyle(
        fontSize: 48.0,
        fontFamily: _semiboldFont,
        color: GPColor.contentPrimary),
    headline2: TextStyle(
        fontSize: 40.0,
        fontFamily: _semiboldFont,
        color: GPColor.contentPrimary),
    headline3: TextStyle(
        fontSize: 32.0,
        fontFamily: _semiboldFont,
        color: GPColor.contentPrimary),
    headline4: TextStyle(
        fontSize: 28.0,
        fontFamily: _semiboldFont,
        color: GPColor.contentPrimary),
    headline5: TextStyle(
        fontSize: 24.0,
        fontFamily: _semiboldFont,
        color: GPColor.contentPrimary),
    headline6: TextStyle(
        fontSize: 20.0,
        fontFamily: _semiboldFont,
        color: GPColor.contentPrimary),
    subtitle1: TextStyle(
        fontSize: 18.0,
        fontFamily: _semiboldFont,
        color: GPColor.contentPrimary),
    subtitle2: TextStyle(
        fontSize: 16.0,
        fontFamily: _semiboldFont,
        color: GPColor.contentPrimary),
    caption: TextStyle(
        fontSize: 14.0,
        fontFamily: _semiboldFont,
        color: GPColor.contentPrimary),
    bodyText1: TextStyle(
        fontSize: 16.0, fontFamily: _normalFont, color: GPColor.contentPrimary),
    bodyText2: TextStyle(
        fontSize: 14.0, fontFamily: _normalFont, color: GPColor.contentPrimary),
    overline: TextStyle(
        fontSize: 12.0, fontFamily: _normalFont, color: GPColor.contentPrimary),
    button: TextStyle(
        fontSize: 14.0,
        fontFamily: _semiboldFont,
        color: GPColor.contentPrimary),
  );

  // DARK THEME TEXT
  static const TextTheme _darkTextTheme = TextTheme(
    headline1: TextStyle(
        fontSize: 48.0,
        fontFamily: _semiboldFont,
        color: GPColor.darkContentPrimary),
    headline2: TextStyle(
        fontSize: 40.0,
        fontFamily: _semiboldFont,
        color: GPColor.darkContentPrimary),
    headline3: TextStyle(
        fontSize: 32.0,
        fontFamily: _semiboldFont,
        color: GPColor.darkContentPrimary),
    headline4: TextStyle(
        fontSize: 28.0,
        fontFamily: _semiboldFont,
        color: GPColor.darkContentPrimary),
    headline5: TextStyle(
        fontSize: 24.0,
        fontFamily: _semiboldFont,
        color: GPColor.darkContentPrimary),
    headline6: TextStyle(
        fontSize: 20.0,
        fontFamily: _semiboldFont,
        color: GPColor.darkContentPrimary),
    subtitle1: TextStyle(
        fontSize: 18.0,
        fontFamily: _semiboldFont,
        color: GPColor.darkContentPrimary),
    subtitle2: TextStyle(
        fontSize: 16.0,
        fontFamily: _semiboldFont,
        color: GPColor.darkContentPrimary),
    caption: TextStyle(
        fontSize: 14.0,
        fontFamily: _semiboldFont,
        color: GPColor.darkContentPrimary),
    bodyText1: TextStyle(
        fontSize: 16.0,
        fontFamily: _normalFont,
        color: GPColor.darkContentPrimary),
    bodyText2: TextStyle(
        fontSize: 14.0,
        fontFamily: _normalFont,
        color: GPColor.darkContentPrimary),
    overline: TextStyle(
        fontSize: 12.0,
        fontFamily: _normalFont,
        color: GPColor.darkContentPrimary),
    button: TextStyle(
        fontSize: 14.0,
        fontFamily: _semiboldFont,
        color: GPColor.darkContentPrimary),
  );

  // LIGHT THEME
  static final ThemeData _lightTheme = ThemeData(
    fontFamily: _normalFont,
    primaryColor: GPColor.workPrimary,
    scaffoldBackgroundColor: GPColor.bgPrimary,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: GPColor.workPrimary,
    ),
    appBarTheme: const AppBarTheme(
      color: GPColor.bgPrimary,
      iconTheme: IconThemeData(color: GPColor.contentPrimary),
    ),
    colorScheme: const ColorScheme.light(
      primary: GPColor.bgPrimary,
      primaryVariant: GPColor.bgSecondary,
    ),
    snackBarTheme:
        const SnackBarThemeData(backgroundColor: GPColor.contentPrimary),
    iconTheme: const IconThemeData(
      color: GPColor.contentInversePrimary,
    ),
    popupMenuTheme: const PopupMenuThemeData(color: GPColor.bgPrimary),
    textTheme: _lightTextTheme,
  );

  // DARK THEME
  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: _normalFont,
    primaryColor: GPColor.workPrimary,
    scaffoldBackgroundColor: GPColor.darkBgPrimary,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: GPColor.workPrimary,
    ),
    appBarTheme: const AppBarTheme(
      color: GPColor.darkBgPrimary,
      iconTheme: IconThemeData(color: GPColor.contentSecondary),
    ),
    colorScheme: const ColorScheme.dark(
      primary: GPColor.bgInversePrimary,
      primaryVariant: GPColor.bgSecondary,
    ),
    snackBarTheme:
        const SnackBarThemeData(backgroundColor: GPColor.bgSecondary),
    iconTheme: const IconThemeData(
      color: GPColor.bgInversePrimary,
    ),
    popupMenuTheme: const PopupMenuThemeData(color: GPColor.bgInversePrimary),
    textTheme: _darkTextTheme,
  );

  /// LIGHT THEME
  static ThemeData theme() {
    return _lightTheme;
  }

  /// DARK THEME
  static ThemeData darktheme() {
    return _darkTheme;
  }

  ThemeMode init() {
    final box = GetStorage();
    String tm = box.read(_sThemeModeKey);
    if (tm == null) {
      box.write(_sThemeModeKey, _sThemeModeLight);
      instance = _lightTheme;
      return ThemeMode.light;
    } else if (tm == _sThemeModeLight) {
      instance = _lightTheme;
      return ThemeMode.light;
    } else {
      instance = _darkTheme;
      return ThemeMode.dark;
    }
  }

  void changeThemeMode(ThemeMode themeMode) {
    final box = GetStorage();
    if (themeMode == ThemeMode.dark) {
      instance = _darkTheme;
      box.write(_sThemeModeKey, _sThemeModeDark);
    } else {
      instance = _lightTheme;
      box.write(_sThemeModeKey, _sThemeModeLight);
    }
    Get.changeThemeMode(themeMode);
    Get.rootController.themeMode.reactive;
  }

  ThemeData general() {
    return instance;
  }
}