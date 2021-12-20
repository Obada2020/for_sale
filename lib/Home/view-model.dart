import 'package:flutter/material.dart';
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Home/view.dart';
import 'package:for_sale/Model/home.dart';
import 'package:for_sale/My-account/view.dart';
import 'package:for_sale/Pages/more.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:for_sale/Sign-in/view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /////////////////////////////////////////////

  RxBool isLogin = false.obs;
  //
  RxInt selectedIndex = 0.obs;
  //
  onItemTapped(int index) async {
    isLogin.value = Get.find<UserController>().token.isNotEmpty;
    // print(isLogin);
    if ((index == 1 && !isLogin.value) || (index == 2 && !isLogin.value)) {
      Get.to(Signin());
      return;
    } else
      selectedIndex.value = index;
  }

  //
  //
  //
  //
  RxList<Widget> widgetOptions =
      <Widget>[HomePage(), AddUI(), MyAccount(), More()].obs;
  //
  RxList<String> titles = [
    "Home_Page".tr,
    "add-ad".tr,
    'VerifyAccount_Appbar'.tr,
    'More_Appbar'.tr,
  ].obs;
  //
  List<Widget> widgetOptions2 = <Widget>[
    HomePage(),
    Signin(),
    Signin(),
    More()
  ];

  //////////////////////////////////////////
  //
  RxList<HomeModel> homeList = <HomeModel>[].obs;
  //
  // RxList<List<Ads>>? adsHome = [<Ads>[]].obs;
  //
  RxString terms = "".obs;
  //
  RxBool isLoading1 = false.obs;
  //
  // RxBool isLoading2 = false.obs;
  //
  @override
  void onInit() {
    super.onInit();
    //
    fetchHomeList();
    //
    fetchTerms();
  }

  //
  fetchHomeList() async {
    //
    var temp = await ApiService.fetchAddHome();
    //
    // if (homeList.length < temp.length) {
    //
    homeList.value = temp;
    // update();
    print("update");
    // }
    print("GG");
    // update();
    //
    // if (homeList.isNotEmpty ) {
    //   await Future.forEach<HomeModel>(
    //     homeList,
    //     (element) async {
    // await fetchAdsHome(element.adCatogaryId);
    //     },
    //   );
    // }
    //
    isLoading1.value = true;
  }

  //
  // fetchAdsHome(id) async {
  //   var t = await ApiService.fdatahomeads(id);
  //   adsHome!..add(t);
  //   inspect(t);
  //   // inspect(adsHome);
  //   // print("the length" + adsHome!.length.toString());
  //   // print("the length" + adsHome!.length.toString());
  //   isLoading2.value = true;
  // }

  //
  fetchTerms() async {
    terms.value = await ApiService.getTerms();
  }
  //
}
