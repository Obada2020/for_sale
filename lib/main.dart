import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view.dart';
<<<<<<< HEAD
import 'package:for_sale/Favorite-ads/view.dart';
import 'package:for_sale/Home/navbar.dart';
=======
import 'package:for_sale/Home/navbar.dart';
import 'package:for_sale/Home/view.dart';
import 'package:for_sale/Pages/setting.dart';
import 'package:for_sale/theme/themes.dart';
>>>>>>> 2816d446a6c9a048f44a9300f9b639128ff95310
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
      home: Navbar(),
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
