import 'package:flutter/material.dart';

Color secondaryColor = Color(0xFF6B53FF);

class HappinessTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 28.0, fontFamily: 'Cafe24Ohsquare'),
    headline2: TextStyle(
        fontSize: 24.0, fontFamily: 'Cafe24Ohsquare', color: Colors.black),
    headline3: TextStyle(fontSize: 20.0, fontFamily: 'Cafe24Ohsquare'),
    headline4: TextStyle(fontSize: 16.0, fontFamily: 'Cafe24Ohsquare'),
    headline5: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      color: secondaryColor,
    ),
    headline6: TextStyle(
      fontSize: 12.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      color: secondaryColor,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      height: 1.4,
      fontFamily: 'Cafe24Ohsquare',
      color: secondaryColor,
    ),
    subtitle2: TextStyle(
      fontSize: 12.0,
      height: 1.4,
      fontFamily: 'Cafe24Ohsquare',
      color: secondaryColor,
    ),
    bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 14.0),
    caption: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Poppins',
      color: Color(0xFF999999),
    ),
    button: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static TextTheme darkTextTheme = TextTheme();

  static ColorScheme lightColorScheme = ColorScheme(
    primary: secondaryColor,
    onPrimary: Colors.white,
    primaryVariant: Colors.orange,
    background: Colors.red,
    onBackground: Colors.black,
    secondary: Colors.red,
    onSecondary: Colors.black,
    secondaryVariant: Colors.deepOrange,
    error: Colors.black,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    brightness: Brightness.light,
  );

  static ThemeData light() {
    return ThemeData(
      fontFamily: 'NotoSansKR',
      brightness: Brightness.light,
      textTheme: lightTextTheme,
      colorScheme: lightColorScheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      fontFamily: 'NotoSansKR',
      brightness: Brightness.dark,
      textTheme: darkTextTheme,
    );
  }
}
