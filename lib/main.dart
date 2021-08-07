import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Pages/setting.dart';
import 'package:for_sale/theme/theme_service.dart';
import 'package:for_sale/theme/themes.dart';
import 'package:for_sale/translate/translate.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home/navbar.dart';

void main() async {
  await GetStorage.init();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var t = sharedPreferences.getString("number");
  var l = sharedPreferences.getString("lang");
  if (l == null) {
    print("main null");
    // if (Get.deviceLocale!.languageCode == Locale('ar').toString()) {
    //   sharedPreferences.setString("lang", "ar");
    //   return;
    // } else if (Get.deviceLocale!.languageCode == Locale('en').toString()) {
    //   sharedPreferences.setString("lang", "en");
    //   return;
    // }
    sharedPreferences.setString("lang", "ar");
    //return;
  }
  // print("main " + t!);
  //runApp(MyApp(t  != null ? 'H' : 'L'));
  runApp(MyApp(l));
  //runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  //var t;
  //MyApp();
  String? lan;
  MyApp(this.lan);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //home: widget.t == 'H' ? Navbar() : Navbar(),
      home: Settings(),
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: themeService().getThemeMode(),
      translations: Translate(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'),
        Locale('en'), // English, no country code
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },

      locale: widget.lan == null || widget.lan == "ar"
          ? Locale("ar")
          : Locale("en"),
      //locale: Locale("ar"),
      //Locale('ar', 'AE'), // translations will be displayed in that locale
      // //locale:
      // Get.deviceLocale,
      fallbackLocale: Locale('ar'),
    );
  }
}
