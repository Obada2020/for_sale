import 'package:flutter/material.dart';
import 'package:for_sale/Add-ad/view-model.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:for_sale/theme/theme_service.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  //bool isLoading = true;
  setSwitchValue(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("switch", value.toString());
    print("===" + value.toString() + "===");
  }

  getSwitchValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var v = sharedPreferences.getString("switch");
    if (v == "true") {
      setState(() {
        isSwitched = true;
      });
      print(isSwitched.toString() + " 2 ");
      //return true;
    } else {
      setState(() {
        isSwitched = false;
      });
      print(isSwitched.toString() + " 3 ");
      // return false;
    }
    //print("+++" + v! + "+++");
  }

  String? _dropDownValue;
  List<String> x = [];
  a() async {
    getSwitchValue();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var t = sharedPreferences.getString("lang");
    // print(t!);
    if (t == "en") {
      setState(() {
        _dropDownValue = "English";
        x = ['English', 'العربية'];
      });
      return "English";
    } else {
      setState(() {
        _dropDownValue = "العربية";
        x = ['العربية', 'English'];
      });
      return "العربية";
    }
    // print("dddddddddddddd");
    // _dropDownValue = "العربية";
    // x = ['العربية', 'English'];
    // return "العربية";

    //isLoading = false;
    // setState(() {});
  }

  change(l) async {
    //isLoading = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("lang", l);
    // print("lang saved successfully" + l);
  }

  //var x;
  @override
  void initState() {
    super.initState();
    a();
    //getSwitchValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        centerTitle: true,
        title: Text(
          'Setting_Appbar'.tr,
          //'الإعدادات'.tr,
          style: Get.textTheme.bodyText1!,
        ),
      ),
      body:
          //  isLoading
          //     ? CircularProgressIndicator()
          //     :
          Container(
        margin: EdgeInsets.fromLTRB(16, 19, 16, 0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Setting_Language'.tr,
                //'اللغة'.tr,
                style: Get.textTheme.bodyText1!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(Get.context!).brightness ==
                                  Brightness.dark
                              ? Colors.transparent
                              : Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(2, 2))
                    ],
                    color: Theme.of(context).primaryColor,
                    //border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 50,
                width: double.infinity,
                child: DropdownButton<String>(
                  isExpanded: true,
                  style: Get.theme.textTheme.bodyText1,
                  value: _dropDownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  underline: Container(
                    height: 0,
                    color: Colors.white,
                  ),
                  onChanged: (newValue) async {
                    if (newValue == 'العربية') {
                      Get.updateLocale(Locale('ar'));
                      await change("ar");
                      setState(() {
                        // isLoading = false;
                      });
                    } else if (newValue == 'English') {
                      Get.updateLocale(Locale('en'));
                      await change("en");
                      setState(() {
                        //isLoading = false;
                      });
                    }
                    setState(() {
                      _dropDownValue = newValue!;
                    });
                  },
                  //
                  items: x
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: Get.textTheme.bodyText1!,
                          ),
                        ),
                      )
                      .toList(),
                  //
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                      color:
                          Theme.of(Get.context!).brightness == Brightness.dark
                              ? Colors.transparent
                              : Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(2, 2))
                ],
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Setting_Theme'.tr,
                    //'الوضع المظلم'.tr,
                    style: Get.textTheme.bodyText1!,
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      ThemeService().changeThemeMode();
                      // Get.changeThemeMode(
                      //     Get.isDarkMode ? lightTheme() : darkTheme());
                      setState(() {
                        isSwitched = value;
                      });
                      setSwitchValue(value);
                      Get.find<HomeController>().onInit();
                      // Restart.restartApp();
                      // Get.find<AddNameController>().update();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
