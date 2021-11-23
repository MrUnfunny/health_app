import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../config/colors.dart';

import '../models/indicator.dart';

class Constants {
  static final List<Indicator> indicators = [
    Indicator(
      name: 'Steps',
      icon: FontAwesomeIcons.running,
      isShort: false,
      isFilled: true,
      shortData: 7995,
      unit: 'Steps',
      color: ThemeColors.backgroundColor,
      data: {},
    ),
    Indicator(
      name: 'Water',
      icon: FontAwesomeIcons.tint,
      isShort: false,
      shortData: 0.75,
      unit: 'Litres',
      color: Colors.blue,
      data: {},
    ),
    Indicator(
      name: 'Calories',
      icon: FontAwesomeIcons.fire,
      isShort: true,
      shortData: 452.21,
      unit: 'Kcal',
      color: ThemeColors.lightMainAccentColor,
      data: {},
    ),
    Indicator(
      name: 'Heart',
      icon: FontAwesomeIcons.heart,
      isShort: false,
      shortData: 86,
      unit: 'bpm',
      color: const Color(0xffee8e92),
      data: {},
    ),
    Indicator(
      name: 'Sleep',
      icon: FontAwesomeIcons.bed,
      isShort: true,
      shortData: 6.65,
      unit: 'hours',
      color: ThemeColors.mainColor,
      data: {},
    ),
  ];

  static const String appName = 'Acme Health';

  static const String signUpButtonText = 'SIGN UP';
  static const String signInButtonText = 'SIGN IN';

  static const String email = 'Email';
  static const String name = 'Name';
  static const String exampleEmail = 'name@example.com';
  static const String examplePassword = 'your password';

  static const String password = 'Password';
  static const String shortName = 'Name should be atleast 3 characters long';
  static const String invalidEmail = 'Invalid Email';
  static const String forgotPassword = 'Forgot Password';
  static const String signInScreenHint = 'Don\'t have an account yet?';
  static const String signUpScreenHint = 'Already have an account?';

  static const String emailForResettingPassword =
      'Enter Email Id for resetting password';
  static const String authenticationError =
      'Please enter valid Email and Password';

  static const String userDataScreenTitle = 'Let\'s get started';
  static const String continu = 'Continue';
  static const String hello = 'Hello ';
}
