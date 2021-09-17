import 'package:flutter/material.dart';
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Home/view.dart';
import 'package:for_sale/My-account/view.dart';
import 'package:for_sale/Pages/more.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:for_sale/Sign-in/view.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  // final String? token;
  // final String? number;
  // Home({this.token, this.number}) {
  //   // Get.find<UserController>().number.value = number!;
  //   // Get.find<UserController>().token.value = token!;
  // }
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLogin = Get.find<UserController>().token.isNotEmpty;
  //
  int _selectedIndex = 0;
  //
  void _onItemTapped(int index) async {
    // print(isLogin);
    if ((index == 1 && !isLogin) || (index == 2 && !isLogin)) {
      Navigator.of(context).push(MaterialPageRoute(builder: (x) => Signin()));
    } else
      setState(() {
        _selectedIndex = index;
      });
  }

  //
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AddUI(),
    MyAccount(),
    More()
  ];
  //
  List<Widget> _widgetOptions2 = <Widget>[
    HomePage(),
    Signin(),
    Signin(),
    More()
  ];
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Theme.of(context).brightness == ThemeMode.dark ? Theme.of(context).backgroundColor,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Navbar_Home'.tr,
              backgroundColor: Color(0x667590)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Navbar_AddAds'.tr,
              backgroundColor: Color(0x667590)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Navbar_MyAccount'.tr,
              backgroundColor: Color(0x667590)),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Navbar_More'.tr,
              backgroundColor: Color(0x667590)),
        ],
        onTap: _onItemTapped,
      ),

      //start body
      body: IndexedStack(
        index: _selectedIndex,
        children: isLogin ? _widgetOptions : _widgetOptions2,
      ),
    );
  }
}
