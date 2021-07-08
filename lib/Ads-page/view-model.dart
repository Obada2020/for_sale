import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  var ads = <AdsModel>[].obs;
  var myads = <MyAdsModel>[].obs;
  var favad = <FavoriteModel>[].obs;

  var accountID;
  @override
  void onInit() {
    super.onInit();
    fdatamyad();
    fdatads();
  }

  fdatads() async {
    List<AdsModel> ad = await ApiService.fdataAds();
    ads.value = ad;
  }

  fdatamyad() async {
    List<MyAdsModel> myad = await ApiService.fdataMyad();
    myads.value = myad;
  }

  fdatafavad() async {
    List<FavoriteModel> fav = await ApiService.fdatafavad();
    favad.value = fav;
  }
  //==================================search========================

  fileserch(String query) async {
    List<AdsModel> dummysearch = ads;
    if (query.isNotEmpty) {
      List<AdsModel> dummylistdata = <AdsModel>[];
      dummysearch.forEach((item) {
        var service = item;
        print("Here");
        if (service.adName!.toLowerCase().contains(query.toLowerCase())) {
          print("Here is a Service ************ " + service.adName!.toString());
          dummylistdata.add(service);
        }
      });
      ads.clear();
      ads.addAll(dummylistdata);
      update();
      return;
    } else {
      ads.clear();
      // ads.addAll(dummysearch);
      fdatads();
      update();
      return;
    }
  }
}
