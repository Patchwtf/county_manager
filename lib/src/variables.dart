import 'package:flutter/material.dart';

double sizeIconBar = 40;
double sizeTextForm = 30;
Color colorBar = Color.fromARGB(102, 85, 85, 85);
Color colorBarSelect = Color.fromARGB(102, 122, 121, 121);
TextStyle stilo = TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0));
Color textColorNormal = Colors.white;

ThemeData tema() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFF0E1436),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color(0xFF11163B),
      secondary: Color(0xFFFF0067),
    ),
    textTheme: const TextTheme(
        bodyText2: TextStyle(
      color: Color(0xFFFFFFFF),
    )),
  );
}
