import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/theme/theme_service.dart';
import 'package:for_sale/theme/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home/navbar.dart';

void main() async {
  await GetStorage.init();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var t = sharedPreferences.getString("number");

  runApp(MyApp(t != null ? 'H' : 'L'));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  var t;
  MyApp(this.t);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: widget.t == 'H' ? Navbar() : Navbar(),
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      //locale: Locale('en', 'US'), // translations will be displayed in that locale
      //fallbackLocale: Locale('ar', 'SA'),
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
