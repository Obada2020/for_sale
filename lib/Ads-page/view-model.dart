import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  var ads = <AdsModel>[].obs;
  var myads = <MyAdsModel>[].obs;
  var favad = <FavoriteModel>[].obs;
  var scrlho = <ScrlHorModel>[].obs;
  List<AdsModel>? dummysearch;

  bool isFirst = true;
  var accountID;
  @override
  void onInit() {
    super.onInit();
    fdatamyad();
    fdatads();
    fdatascrol();
    fdatafavad();
    fdatadsbynamescrl();
  }

  fdatads() async {
    List<AdsModel> ad = await ApiService.fdataAds();
    ads.value = ad;
    print("Here APIIIIIIIIIIIIIIIIIIII");
    dummysearch = ads.toList();
    //******************************************************************** */
    update();
  }

  fdatadsbynamescrl() async {
    List<AdsModel> adby = await ApiService.fdataAdsNameScrl();
    ads.value = adby;
    dummysearch = ads.toList();
    update();
  }

  fdatamyad() async {
    List<MyAdsModel> myad = await ApiService.fdataMyad();
    myads.value = myad;
  }

  fdatafavad() async {
    List<FavoriteModel> fav = await ApiService.fdatafavad();
    favad.value = fav;
  }

  fdatascrol() async {
    List<ScrlHorModel> scroll = await ApiService.fdataScrlho();
    scrlho.value = scroll;
  }
  //==================================search========================

  fileserch(String query) async {
    List<AdsModel> dummylistdata = <AdsModel>[];
    if (query.isNotEmpty && dummysearch!.isNotEmpty) {
      dummysearch!.forEach((item) {
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
    } else {
      print(dummysearch!.length);
      ads.clear();
      ads.addAll(dummysearch!);
      update();
    }
  }
  //====================================================================

}
