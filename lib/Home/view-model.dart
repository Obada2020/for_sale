import 'dart:developer';

import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Home/model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //
  var homeList = <HomeModel>[].obs;
  //
  List<List<AdsHomeModel>>? adsHome = [<AdsHomeModel>[]];
  //
  RxString terms = "".obs;
  //
  RxBool isLoading1 = false.obs;
  //
  RxBool isLoading2 = false.obs;
  //
  @override
  void onInit() {
    super.onInit();
    fetchHomeList();
    fetchTerms();
  }
  //
  fetchHomeList() async {
    //
    homeList.value = await ApiService.fetchAddHome();
    //
    if (homeList.isNotEmpty) 
      await Future.forEach<HomeModel>(homeList, (element) async { 
        await fetchAdsHome(element.adCatogaryId);
       });
    //
    isLoading1.value = true;
  }
  //
  fetchAdsHome(id) async {
    var t = await ApiService.fdatahomeads(id);
    adsHome!.add(t);
    // inspect(adsHome);
    // print("the length" + adsHome!.length.toString());
    // print("the length" + adsHome!.length.toString());
    isLoading2.value = true;
  }

  //
  fetchTerms() async {
    terms.value = await ApiService.getTerms();
  }
  //
}
