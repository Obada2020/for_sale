import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  int? adcatogaryid;
  int? catogarydetailsid;
  int? addescriptionsid;
  AdsController(
      {this.adcatogaryid, this.catogarydetailsid, this.addescriptionsid});
  var ads = <AdsModel>[].obs;
  var fullads = <AdsModel>[].obs;
  var scrl = <AdsModel>[].obs;
  // var myads = <MyAdsModel>[].obs;
  // var scrlho = <ScrlHorModel>[].obs;
  // var favad = <FavoriteModel>[].obs;
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

  // fdatamyad() async {
  //   List<MyAdsModel> myad = await ApiService.fdataMyad();
  //   myads.value = myad;
  // }

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
    print(a.toString() + " " + c.toString() + " " + d.toString());
    List<AdsModel> adby = await ApiService.fdataAdsNameScrl(
      a,
      c,
      d,
    );
    fullads.value = adby;
    scrl.value = adby;
    ads.value = adby;
    dummysearch = ads.toList();
  }

  // fdatascrol() async {
  //   // List<ScrlHorModel> scroll = await ApiService.fdataScrlho();
  //   scrlho.value = scroll;
  // }

  // fdatafavad() async {
  //   List<FavoriteModel> fav = await ApiService.fdatafavad();
  //   favad.value = fav;
  // }
  //==================================search========================

  fileserch(String query) async {
    List<AdsModel> dummylistdata = <AdsModel>[];
    if (query.isNotEmpty && dummysearch!.isNotEmpty) {
      dummysearch!.forEach((item) {
        var service = item;
        if (service.adName!.toLowerCase().contains(query.toLowerCase()) ||
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
        if (service.adTypeNameId!.toString().contains(query)) {
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
