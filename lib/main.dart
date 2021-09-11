import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:for_sale/Binding/binding.dart';
import 'package:for_sale/Home/navbar.dart';
import 'package:for_sale/theme/theme_service.dart';
import 'package:for_sale/theme/themes.dart';
import 'package:for_sale/translate/translate.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var t = sharedPreferences.getString("token");
  var n = sharedPreferences.getString("number");
  var l = sharedPreferences.getString("lang");
  if (l == null) {
    if (Get.deviceLocale!.languageCode == Locale('ar').toString()) {
      sharedPreferences.setString("lang", "ar");
      return;
    } else if (Get.deviceLocale!.languageCode == Locale('en').toString()) {
      sharedPreferences.setString("lang", "en");
      return;
    }
  }
  runApp(MyApp(l ?? "", t ?? "", n ?? ""));
}

class MyApp extends StatefulWidget {
  String? lan;
  String? t;
  String? n;

  MyApp(this.lan, this.t, this.n);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      home: Home(number: widget.n!, token: widget.t!),
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
