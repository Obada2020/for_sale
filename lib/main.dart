import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
<<<<<<< HEAD
import 'Add-ad/view.dart';
import 'Chat-WithAdmin/view.dart';
=======
import 'package:for_sale/Ads-page/view.dart';
import 'package:for_sale/Favorite-ads/view.dart';
import 'package:for_sale/My-ads/view.dart';
import 'package:get/get.dart';
>>>>>>> 8bc73247ad22a6982a8e8a89af6bf16f4a37f56b

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
<<<<<<< HEAD
    return MaterialApp(
      home: ChatUI(),
=======
    return GetMaterialApp(
      home: Ads(),
>>>>>>> 8bc73247ad22a6982a8e8a89af6bf16f4a37f56b
      debugShowCheckedModeBanner: false,
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
