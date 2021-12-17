import 'package:flutter/material.dart';

Color black = Color(0xFF1A1A1A);
Color purple = Color(0xFF6B53FF);

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
      color: purple,
    ),
    headline6: TextStyle(
      fontSize: 12.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      color: purple,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
    ), // hintText
    subtitle2: TextStyle(
      fontSize: 12.0,
      height: 1.4,
      fontFamily: 'Cafe24Ohsquare',
      color: purple,
    ),
    bodyText1: TextStyle(fontSize: 14.0),
    bodyText2: TextStyle(fontSize: 14.0), //Text()
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
    primary: purple,
    onPrimary: Colors.red,
    primaryVariant: Colors.red,
    background: Colors.red,
    onBackground: Colors.red,
    secondary: Colors.red,
    onSecondary: Colors.red,
    secondaryVariant: Colors.red,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.red,
    onSurface: Colors.red,
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
