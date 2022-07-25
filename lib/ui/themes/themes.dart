import 'package:flutter/material.dart';

class LightTheme {
  ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff00adf1),
    primarySwatch: const MaterialColor(0xFF00adf1, {
      50: Color(0xffE0F5FD),
      100: Color(0xffB3E6FB),
      200: Color(0xff80D6F8),
      300: Color(0xff4DC6F5),
      400: Color(0xff26B9F3),
      500: Color(0xff00ADF1),
      600: Color(0xff00A6EF),
      700: Color(0xff009CED),
      800: Color(0xff0093EB),
      900: Color(0xff0083E7),
    }),
    iconTheme: const IconThemeData(color: Color(0xff003767)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.transparent,
        backgroundColor: Color(0xff00adf1)),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
        bodyText1: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
  );
}

//TODO implement Dark mode
class DarkTheme {
  ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff3d8575),
    primarySwatch: Colors.teal,
    iconTheme: const IconThemeData(color: Color(0xff003767)),
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(color: Colors.black)),
  );
}