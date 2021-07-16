import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/constant.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  String _dropDownValue = 'العربية';
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
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            'الإعدادات',
            style: klabelAppbarStyle,
          ),
        )),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(16, 19, 16, 0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'اللغة',
                style: klabelStyleBold12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.only(left: 10),
                height: 50,
                width: double.infinity,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _dropDownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  //style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 0,
                    color: Colors.white,
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _dropDownValue = newValue!;
                    });
                  },
                  items: <String>['العربية', 'English']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          value,
                          style: klabelStyleBold12,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        'الوضع المظلم',
                        style: klabelStyleBold12,
                      ),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        Get.changeThemeMode(
                            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                        setState(() {
                          isSwitched = value;
                        });
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
