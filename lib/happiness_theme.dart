import 'package:flutter/material.dart';

Color black = Color(0xFF1A1A1A);
Color purple = Color(0xFF6B53FF);
Color gray = Color(0xFFF5F5F5);
Color grayDark = Color(0xFF999999);

class HappinessTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 28.0,
      fontFamily: 'Cafe24Ohsquare',
      color: black,
    ),
    headline2: TextStyle(
      fontSize: 24.0,
      fontFamily: 'Cafe24Ohsquare',
      color: Colors.black,
    ),
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
      color: grayDark,
    ),
    button: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    overline: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static TextTheme darkTextTheme = TextTheme();

  static ColorScheme lightColorScheme = ColorScheme(
    primary: purple,
    onPrimary: Colors.white, // button text
    primaryVariant: Colors.red,
    background: Colors.red,
    onBackground: Colors.red,
    secondary: Colors.red,
    onSecondary: Colors.red,
    secondaryVariant: Colors.red,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.white,
    onSurface: gray, // disabled
    brightness: Brightness.light,
  );

  static ThemeData light() {
    return ThemeData(
      fontFamily: 'NotoSansKR',
      brightness: Brightness.light,
      textTheme: lightTextTheme,
      colorScheme: lightColorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return grayDark;
            }
            return Colors.white;
          }),
        ),
      ),
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
