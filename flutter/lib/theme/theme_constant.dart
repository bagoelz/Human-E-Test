import 'package:flutter/material.dart';

class ThemaSaya {
  ThemaSaya._();
  static String appName = "Feed Subscriber";

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
      fontFamily: 'Proxima Nova',
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        headline3: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
      ));

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme(
      primary: Color(0xFFFE3C5B),
      primaryVariant: Color(0xFFFE3C5B),
      secondary: Color(0xFFe84545),
      secondaryVariant: Color(0xFFe84545),
      surface: Color(0xFFFFFFFF),
      error: Color(0x00000000),
      brightness: Brightness.light,
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF2b2e4a),
      onSurface: Color(0xFFFFFFFF),
      onError: Color(0xFF2b2e4a),
    ),
    iconTheme: const IconThemeData(color: Colors.red, opacity: 0.8),
    fontFamily: 'Proxima Nova',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
