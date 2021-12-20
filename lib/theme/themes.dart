import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';

class Themes {
  //
  //
  //
  final lightTheme = ThemeData.light().copyWith(
    //
    // primaryColor: Color(0xffF2F2F2),

    //
    primaryColor: Color(0xFFFFFFFF),
    //
    primaryColorDark: kGColor.colors.first,
    //

    primaryColorLight: Color(0xFF000000),
    //
    hintColor: Color(0xFFE8CECE),
    //
    cardColor: Color(0xFF487485).withOpacity(
      0.2,
    ),

    //
    //

    //
    textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
          fontFamily: 'FairuzBold',
          fontSize: 12,
        ),
        //
        headline1: TextStyle(
          color: Colors.white,
          fontFamily: 'FairuzBold',
          fontSize: 15,
        ),
        //
        button: TextStyle(
          color: Colors.black,
          fontSize: 15,
        )
        //
        ),
  );
  //
  // .copyWith(
  //   textTheme: TextTheme(
  //     bodyText1: TextStyle(color: Colors.black),
  //     headline1: TextStyle(color: Colors.black),
  //   ),
  //   buttonColor: Colors.black,
  //   iconTheme: IconThemeData(color: Colors.black),
  // );520/50h
  final darkTheme = ThemeData.dark().copyWith(
    //
    //
    hintColor: Color(0xFFB4B4B4),

    //
    primaryColor: Color(0xFF000000),
    //
    primaryColorDark: kGColor.colors.first,
    //
    primaryColorLight: Color(0x00FFFFFF),
    //
    cardColor: Color(0xFFC6D9E1).withOpacity(
      0.2,
    ),
    //
    textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
          fontFamily: 'FairuzBold',
          fontSize: 12,
        ),
        //
        //
        headline1: TextStyle(
          color: Colors.black,
          fontFamily: 'FairuzBold',
          fontSize: 15,
        ),
        //
        button: TextStyle(
          color: Colors.white,
          fontSize: 15,
        )
        //
        ),
  );
  // .copyWith(
  //   textTheme: TextTheme(
  //     bodyText1: TextStyle(color: Colors.red),
  //     headline1: TextStyle(color: Colors.red),
  //   ),
  //   buttonColor: Colors.white,
  //   iconTheme: IconThemeData(color: Colors.red),
  // );
}
