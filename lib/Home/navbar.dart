import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  //
  //

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.titles[controller.selectedIndex.value],
            style: Get.textTheme.headline1,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
            content: Text(
          "Tap back again to leave",
          textAlign: TextAlign.center,
        )),
        child: Obx(
          () => IndexedStack(
              index: controller.selectedIndex.value,
              children: controller.widgetOptions),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          // backgroundColor: Theme.of(context).brightness == ThemeMode.dark ? Theme.of(context).backgroundColor,
          currentIndex: controller.selectedIndex.value,
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
          onTap: (d) => controller.onItemTapped(d),
        ),
      ),

      //start body
    );
  }
}
