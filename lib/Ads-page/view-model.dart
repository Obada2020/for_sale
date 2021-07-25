import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
<<<<<<< HEAD
  int? adcatogaryid;
  int? catogarydetailsid;
  int? addescriptionsid;
  int? adtypenameid;
  AdsController(
      {this.adcatogaryid, this.catogarydetailsid, this.addescriptionsid});
=======
  int? adCatogaryId;
  int? adDescriptionsId;
  int? catogaryDetailsId;

  AdsController(
      {this.adCatogaryId, this.adDescriptionsId, this.catogaryDetailsId});

>>>>>>> 21dcb79a1bf0f3030268c250b6176ae5ff0925c6
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
<<<<<<< HEAD
    fdatadsbynamescrl();
    // fdatads();
=======
    print({"adCatogaryId ================>":adCatogaryId});
    print({"adDescriptionsId ================>":adDescriptionsId});
    print({"catogaryDetailsId ================>":catogaryDetailsId});
    fdatads();
>>>>>>> 21dcb79a1bf0f3030268c250b6176ae5ff0925c6
    fdatafavad();
    fdatamyad();
    fdatascrol();
  }

  fdatamyad() async {
    List<MyAdsModel> myad = await ApiService.fdataMyad();
    myads.value = myad;
  }

<<<<<<< HEAD
  // fdatads() async {
  //   List<AdsModel> ad = await ApiService.fdataAds(
  //       this.adcatogaryid, this.catogarydetailsid, this.addescriptionsid);
  //   ads.value = ad;
  //   print("Here APIIIIIIIIIIIIIIIIIIII");
  //   dummysearch = ads.toList();
  //   //******************************************************************** */
  //   update();
  // }
=======
  fdatads() async {
    List<AdsModel> ad = await ApiService.fdataAds(
        adCatogaryId, adDescriptionsId, catogaryDetailsId);
    ads.value = ad;
    print("Here APIIIIIIIIIIIIIIIIIIII");
    dummysearch = ads.toList();
    //******************************************************************** */
    update();
  }
>>>>>>> 21dcb79a1bf0f3030268c250b6176ae5ff0925c6

  fdatadsbynamescrl() async {
    List<AdsModel> adby = await ApiService.fdataAdsNameScrl(this.adcatogaryid,
        this.catogarydetailsid, this.addescriptionsid, this.adtypenameid);
    ads.value = adby;
    dummysearch = ads.toList();
    print('**************');
    print(adcatogaryid);
    print(catogarydetailsid);
    print(addescriptionsid);
    print(adtypenameid);
    print('**************');

    update();
  }

  fdatascrol() async {
    List<ScrlHorModel> scroll = await ApiService.fdataScrlho(
        this.adcatogaryid, this.catogarydetailsid, this.addescriptionsid);
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
        if (service.adname!.toLowerCase().contains(query.toLowerCase())) {
          print("Here is a Service ************ " + service.adname!.toString());
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
