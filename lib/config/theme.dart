import 'package:flutter/material.dart';
import 'colors.dart';
import 'config.dart';

ThemeData themeData(ThemeData baseTheme) {
  ThemeColors.loadColors();
  return baseTheme.copyWith(
    primaryColor: ThemeColors.mainColor,
    backgroundColor: ThemeColors.backgroundColor,
    scaffoldBackgroundColor: ThemeColors.backgroundColor,
    colorScheme: baseTheme.colorScheme.copyWith(
      secondary: ThemeColors.lightMainAccentColor,
    ),
    iconTheme: baseTheme.iconTheme.copyWith(
      color: baseTheme.colorScheme.secondary,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: ThemeColors.textPrimaryColor,
        fontFamily: Config.defaultFontFamily,
      ),
      headline2: TextStyle(
        color: ThemeColors.textPrimaryColor,
        fontFamily: Config.defaultFontFamily,
      ),
      headline3: TextStyle(
        color: ThemeColors.textPrimaryColor,
        fontFamily: Config.defaultFontFamily,
      ),
      headline4: TextStyle(
        color: ThemeColors.textPrimaryColor,
        fontFamily: Config.defaultFontFamily,
      ),
      headline5: TextStyle(
        color: ThemeColors.textPrimaryColor,
        fontFamily: Config.defaultFontFamily,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: ThemeColors.textPrimaryColor,
        fontFamily: Config.defaultFontFamily,
      ),
      subtitle1: TextStyle(
        color: ThemeColors.grey,
        fontFamily: Config.defaultFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      subtitle2: TextStyle(
        color: ThemeColors.grey,
        fontFamily: Config.defaultFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: ThemeColors.textPrimaryColor,
        fontFamily: Config.defaultFontFamily,
      ),
      bodyText2: TextStyle(
        color: ThemeColors.textPrimaryColor,
        fontFamily: Config.defaultFontFamily,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(
        color: ThemeColors.textPrimaryColor,
        fontFamily: Config.defaultFontFamily,
      ),
      caption: TextStyle(
        color: ThemeColors.textPrimaryDarkColor,
        fontFamily: Config.defaultFontFamily,
      ),
      overline: TextStyle(
        color: ThemeColors.textPrimaryColor,
        fontFamily: Config.defaultFontFamily,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: ThemeColors.backgroundColor,
    ),
  );
}
