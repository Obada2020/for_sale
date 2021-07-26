import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  int? adcatogaryid;
  int? catogarydetailsid;
  int? addescriptionsid;
  AdsController(
      {this.adcatogaryid, this.catogarydetailsid, this.addescriptionsid});
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
    // fdatadsbynamescrl();
    // fdatads();
    // fdatafavad();
    // fdatamyad();
    // fdatascrol();
  }

  fdatamyad() async {
    List<MyAdsModel> myad = await ApiService.fdataMyad();
    myads.value = myad;
  }

  // fdatads() async {
  //   List<AdsModel> ad = await ApiService.fdataAds(
  //       this.adcatogaryid, this.catogarydetailsid, this.addescriptionsid);
  //   ads.value = ad;
  //   print("Here APIIIIIIIIIIIIIIIIIIII");
  //   dummysearch = ads.toList();
  //   //*********************************************************************/
  //   update();
  // }

  fdatadsbynamescrl(a, c, d, n) async {
    print("fffffffffffffffffffffffffffff");
    // print(this.adcatogaryid);
    print(a.toString() +
        "" +
        c.toString() +
        "" +
        d.toString() +
        "" +
        n.toString());
    List<AdsModel> adby = await ApiService.fdataAdsNameScrl(a, c, d, n);
    ads.value = adby;
    dummysearch = ads.toList();
    // print('**************');
    // print(adcatogaryid);
    // print(catogarydetailsid);
    // print(addescriptionsid);
    // print(adtypenameid);
    // print('**************');

    // update();
  }

  // fdatascrol() async {
  //   // List<ScrlHorModel> scroll = await ApiService.fdataScrlho();
  //   scrlho.value = scroll;
  // }

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
        if (service.adname!.toLowerCase().contains(query.toLowerCase()) ||
            service.adDescription!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            service.adPrice!.toLowerCase().contains(query.toLowerCase())) {
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
  //==================================filter========================

  filter(String query) async {
    List<AdsModel> dummylistdata = <AdsModel>[];
    if (query.isNotEmpty && dummysearch!.isNotEmpty) {
      dummysearch!.forEach((item) {
        var service = item;
        if (service.adname!.toLowerCase().contains(query.toLowerCase()) ||
            service.adDescription!
                .toLowerCase()
                .contains(query.toLowerCase())) {
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
