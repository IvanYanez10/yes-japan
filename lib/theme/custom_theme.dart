import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: CustomColors.primary,
        secondaryHeaderColor: CustomColors.accent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          bodyText1: TextStyle(fontSize: 15.0),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.accent,
        )
    );
  }
}