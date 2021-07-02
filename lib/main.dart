import 'package:flutter/material.dart';
// import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Ads-page/view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Ads(),
      debugShowCheckedModeBanner: false,
     localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    const Locale('ar', 'AE'), // English, no country code
  ],
  locale: Locale("ar","AE"),
    );
  }
}
