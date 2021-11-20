import 'package:flutter/material.dart';

class ThemeColors {
  ThemeColors._();

  static late Color mainColor;
  static late Color lightMainAccentColor;

  static late Color textPrimaryColor;
  static late Color textPrimaryDarkColor;

  static late Color backgroundColor;
  static late Color backgroundDarkColor;

  static late Color white;
  static late Color black;
  static late Color grey;
  static late Color transparent;

  static void loadColors() {
    mainColor = const Color(0xFF5142ab);
    lightMainAccentColor = const Color(0xFFff8354);

    textPrimaryColor = const Color(0xFF050617);
    textPrimaryDarkColor = const Color(0xFFD2D6EF);

    backgroundColor = const Color(0xFFedebf7);

    white = Colors.white;
    black = Colors.black;
    grey = Colors.grey;
    transparent = Colors.transparent;

    backgroundDarkColor = const Color(0xFFFFFCF2);
  }
}
