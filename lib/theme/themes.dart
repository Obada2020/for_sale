import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.red),
    ),
    buttonColor: Colors.black,
  );
  final darkTheme = ThemeData.dark().copyWith(
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white),
    ),
    buttonColor: Colors.white,
  );
}
