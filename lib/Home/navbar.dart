import 'package:flutter/material.dart';
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Home/view.dart';
import 'package:for_sale/My-account/view.dart';
import 'package:for_sale/Pages/more.dart';
import 'package:for_sale/constant/constant.dart';

class Navbar extends StatefulWidget {
  Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[Home(), AddUI(), MyAccount(), More()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //start appbar
        appBar: AppBar(
          title:
              Center(child: Text("الصفحة الرئيسة", style: klabelAppbarStyle)),
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: kGColor),
          ),
        ),

        //start BottomNavigationBar
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية',
                backgroundColor: Color(0xff667590)),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'اضافة اعلان',
              backgroundColor: Color(0xff667590),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'حسابي',
                backgroundColor: Color(0xff667590)),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'المزيد',
                backgroundColor: Color(0xff667590)),
          ],
          onTap: _onItemTapped,
        ),

        //start body
        body: _widgetOptions[_selectedIndex]);
  }
}
