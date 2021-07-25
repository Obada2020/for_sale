import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view.dart';
import 'package:for_sale/Home/navbar.dart';
import 'package:for_sale/My-account/view.dart';
import 'package:for_sale/Pages/more.dart';
import 'package:for_sale/Pages/privacy_and_terms.dart';
import 'package:for_sale/Pages/setting.dart';
import 'package:for_sale/Sign-in/Signin_view.dart';
import 'package:for_sale/Sign-in/Verify-account_view.dart';
import 'package:for_sale/theme/theme_service.dart';
import 'package:for_sale/theme/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Ads-page/view.dart';
import 'Home/navbar.dart';

void main() async {
  await GetStorage.init();
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
      home: Navbar(),
=======
      home: Signin(),
>>>>>>> 143e13e51de44772bef72b65c514c7c3d9b5ec0c
>>>>>>> 21dcb79a1bf0f3030268c250b6176ae5ff0925c6
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: themeService().getThemeMode(),
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
