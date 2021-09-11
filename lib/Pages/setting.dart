import 'package:flutter/material.dart';
import 'package:for_sale/theme/theme_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

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
    } else if (v == "false") {
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
    } else if (t == "ar") {
      setState(() {
        _dropDownValue = "العربية";
        x = ['العربية', 'English'];
      });
      return "العربية";
    }
    //isLoading = false;
    setState(() {});
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
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        centerTitle: true,
        title: Text(
          'Setting_Appbar'.tr,
          //'الإعدادات'.tr,
          style: klabelAppbarStyle,
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
                style: klabelStyleBold12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    //border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 50,
                width: double.infinity,
                child: DropdownButton<String>(
                  isExpanded: true,
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
                  items: x.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: klabelStyleBold12,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
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
                      style: klabelStyleBold12,
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        themeService().changeThemeMode();
                        // Get.changeThemeMode(
                        //     Get.isDarkMode ? lightTheme() : darkTheme());
                        setState(() {
                          isSwitched = value;
                        });
                        setSwitchValue(value);
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
