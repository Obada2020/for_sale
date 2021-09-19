import 'dart:developer';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Model/home.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //
  RxList<HomeModel> homeList = <HomeModel>[].obs;
  //
  RxList<List<Ads>>? adsHome = [<Ads>[]].obs;
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
    //
    fetchHomeList();
    //
    fetchTerms();
  }

  //
  fetchHomeList() async {
    //
    var temp = await ApiService.fetchAddHome();
    if (homeList.length < temp.length) {
      homeList.value = temp;
    }
    print("GG");

    //
    if (homeList.isNotEmpty) {
      await Future.forEach<HomeModel>(
        homeList,
        (element) async {
          await fetchAdsHome(element.adCatogaryId);
        },
      );
    }
    //
    isLoading1.value = true;
  }

  //
  fetchAdsHome(id) async {
    var t = await ApiService.fdatahomeads(id);
    adsHome!..add(t);
    inspect(t);
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
