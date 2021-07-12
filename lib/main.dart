import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view.dart';
<<<<<<< HEAD
import 'package:for_sale/Home/navbar.dart';
import 'package:for_sale/Home/view.dart';
=======
<<<<<<< HEAD
import 'package:for_sale/Pages/setting.dart';
import 'package:for_sale/theme/themes.dart';
=======
import 'package:for_sale/Favorite-ads/view.dart';
>>>>>>> c00dc1b23b94a566fd79b792f3624ee543bdddb5
>>>>>>> d3437be45b1fc35417c5e1353d57145d05750b3c
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
<<<<<<< HEAD
      home: Navbar(),
=======
<<<<<<< HEAD
      home: Settings(),
=======
      home: Ads(),
>>>>>>> c00dc1b23b94a566fd79b792f3624ee543bdddb5
>>>>>>> d3437be45b1fc35417c5e1353d57145d05750b3c
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'), // English, no country code
      ],
      locale: Locale("ar", "AE"),
    );
  }
}
