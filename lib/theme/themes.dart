import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light()
      .copyWith(primaryColor: Colors.white, accentColor: Colors.grey[200]);
  // .copyWith(
  //   textTheme: TextTheme(
  //     bodyText1: TextStyle(color: Colors.black),
  //     headline1: TextStyle(color: Colors.black),
  //   ),
  //   buttonColor: Colors.black,
  //   iconTheme: IconThemeData(color: Colors.black),
  // );
  final darkTheme = ThemeData.dark()
      .copyWith(primaryColor: Colors.black, accentColor: Colors.white);
  // .copyWith(
  //   textTheme: TextTheme(
  //     bodyText1: TextStyle(color: Colors.red),
  //     headline1: TextStyle(color: Colors.red),
  //   ),
  //   buttonColor: Colors.white,
  //   iconTheme: IconThemeData(color: Colors.red),
  // );
}
