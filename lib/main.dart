import 'package:flutter/material.dart';
// import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Ads-page/view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:for_sale/Favorite-ads/view.dart';
import 'package:for_sale/Home/view.dart';
import 'package:for_sale/My-account/view.dart';
import 'package:for_sale/Pages/privacy_and_terms.dart';
import 'package:for_sale/Pages/setting.dart';
import 'package:for_sale/Sign-in/view.dart';
import 'package:for_sale/Verify-account/view.dart';

import 'Ads-details/view.dart';
import 'Home/navbar.dart';
import 'My-ads/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAccount(),
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
