import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
<<<<<<< HEAD
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view.dart';
import 'package:for_sale/Home/navbar.dart';
import 'package:for_sale/My-account/view.dart';
import 'package:for_sale/Pages/more.dart';
import 'package:for_sale/Pages/privacy_and_terms.dart';
import 'package:for_sale/Pages/setting.dart';
import 'package:for_sale/Sign-in/view.dart';
import 'package:for_sale/Verify-account/view.dart';
=======
import 'package:for_sale/Sign-in/view.dart';
>>>>>>> 2ec1f854f3eec6d9ec967a5624df98bd7f822204
import 'package:for_sale/theme/theme_service.dart';
import 'package:for_sale/theme/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
      home: Signin(),
>>>>>>> 2ec1f854f3eec6d9ec967a5624df98bd7f822204
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
