import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  int? adCatogaryId;
  int? adDescriptionsId;
  int? catogaryDetailsId;

  AdsController(
      {this.adCatogaryId, this.adDescriptionsId, this.catogaryDetailsId});

  var ads = <AdsModel>[].obs;
  var myads = <MyAdsModel>[].obs;
  var scrlho = <ScrlHorModel>[].obs;
  var favad = <FavoriteModel>[].obs;
  List<AdsModel>? dummysearch;

  bool isFirst = true;
  var accountID;
  @override
  void onInit() {
    super.onInit();
    print({"adCatogaryId ================>":adCatogaryId});
    print({"adDescriptionsId ================>":adDescriptionsId});
    print({"catogaryDetailsId ================>":catogaryDetailsId});
    fdatads();
    fdatafavad();
    fdatamyad();
    fdatascrol();
    fdatadsbynamescrl();
  }

  fdatamyad() async {
    List<MyAdsModel> myad = await ApiService.fdataMyad();
    myads.value = myad;
  }

  fdatads() async {
    List<AdsModel> ad = await ApiService.fdataAds(
        adCatogaryId, adDescriptionsId, catogaryDetailsId);
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

  fdatascrol() async {
    List<ScrlHorModel> scroll = await ApiService.fdataScrlho();
    scrlho.value = scroll;
  }

  fdatafavad() async {
    List<FavoriteModel> fav = await ApiService.fdatafavad();
    favad.value = fav;
  }
  //==================================search========================

  fileserch(String query) async {
    List<AdsModel> dummylistdata = <AdsModel>[];
    if (query.isNotEmpty && dummysearch!.isNotEmpty) {
      dummysearch!.forEach((item) {
        var service = item;
        print("Here");
        if (service.adDescription!
            .toLowerCase()
            .contains(query.toLowerCase())) {
          print("Here is a Service ************ " +
              service.adDescription!.toString());
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
