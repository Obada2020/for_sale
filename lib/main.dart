import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:for_sale/Binding/binding.dart';
import 'package:for_sale/Home/navbar.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:for_sale/theme/theme_service.dart';
import 'package:for_sale/theme/themes.dart';
import 'package:for_sale/translate/translate.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  //
  var connectivityResult = await (Connectivity().checkConnectivity());
  print(connectivityResult);
  if (connectivityResult == ConnectivityResult.none) {
    return runApp(MyAppo());
  }
  //
  await GetStorage.init();
  //
  var c = Get.put(UserController(), permanent: true);
  //
  await c.getPreferences();
  // await Get.putAsync(() => UserController().getPreferences(), permanent: true);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // var t = sharedPreferences.getString("token");
  // var n = sharedPreferences.getString("number");
  var l = sharedPreferences.getString("lang");
  //
  if (l == null) {
    if (Get.deviceLocale!.languageCode == Locale('ar').toString()) {
      sharedPreferences.setString("lang", "ar");
    } else if (Get.deviceLocale!.languageCode == Locale('en').toString()) {
      sharedPreferences.setString("lang", "en");
    }
  }
  runApp(
    RestartWidget(
      child: MyApp(
        l ?? "",
        // c.token.value,
        // c.number.value,
      ),
    ),
  );
}

///

class MyAppo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Scaffold(body: new MyHome()));
  }
}

class MyHome extends StatelessWidget {
  // Wrapper Widget
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return Container(
      color: kGColor.colors.first,
      child: Center(
        child: Image.asset(
          "imag/forsale.png",
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Text(
          "تأكد من وجود اتصال باللإنترنت",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.right,
        ),
        contentPadding: EdgeInsets.all(15),
        actionsAlignment: MainAxisAlignment.start,
        actions: [
          ElevatedButton(
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
            child: Text(
              "موافق",
            ),
          )
        ],
      ),
    );
  }
  //
  //
}

///

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

//
class MyApp extends StatefulWidget {
  final String? lan;
  MyApp(
    this.lan,
  );
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      translations: Translate(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //
      supportedLocales: [
        Locale('ar'),
        Locale('en'), // English, no country code
      ],
      //
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

      fallbackLocale: Locale('ar'),
    );
  }
}
