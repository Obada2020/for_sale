import 'dart:developer';

import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Model/catogary_page.dart';
import 'package:for_sale/Model/favorite_ads.dart';
import 'package:for_sale/Model/home.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  //
  int? adcatogaryid;
  //
  int? catogarydetailsid;
  //
  int? addescriptionsid;
  //
  RxInt selectIndex = 0.obs;
  //
  AdsController({
    this.adcatogaryid,
    this.catogarydetailsid,
    this.addescriptionsid,
  });
  //
  RxBool adsLoading = false.obs;
  // RxList<Ads> ads = <Ads>[].obs;
  //
  //
  RxList<Ads> fullads = <Ads>[].obs;
  //
  var scrl = <String>[].obs;
  //
  RxBool isLoadingMyAds = false.obs;
  //
  RxList<FavoriteModel> favad = <FavoriteModel>[].obs;
  RxBool isLoadingFavorite = false.obs;
  var myads = <Ads>[].obs;
  //
  var allAds = <Ads>[].obs;
  //
  RxBool isLoadingAllAds = false.obs;
  //

  //
  List<Ads>? dummysearch;
  //
  List<Ads>? dummysearchHome;
  // bool isFirst = true;
  // var accountID;
  //
  var result = false.obs;

  //
  @override
  void onInit() {
    super.onInit();
  }

  //
  addFavorite(adId) async {
    var res = await ApiService.fdatacdfav(adId);

    // result.value = res;
    // print('result ctrl==  $res');
    return res;
  }

  //
  void getAdType(List<Ads> list) {
    scrl.value = [];
    List<String>? temp = <String>[];
    temp = list.map<String>((e) => e.adtypename!.adTypeName!).toList();
    scrl.value = temp.toSet().toList();
  }

  //
  fdatadsbynamescrl(int a, int c, int d) async {
    adsLoading.value = true;
    selectIndex = 0.obs;
    fullads.value = [];
    print(a.toString() + "   " + a.toString() + "   " + a.toString());
    List<Ads> adby = await ApiService.fdataAdsNameScrl(
      a.toString(),
      c.toString(),
      d.toString(),
    );
    adsLoading.value = false;
    inspect(adby);
    if (adby.isNotEmpty) {
      // ads.value = adby;
      fullads.value = adby;
    }
    getAdType(adby);
    dummysearch = fullads.toList();
    filterads(scrl[0].toString());
    print(adsLoading);
    // update();
  }

  //==================================search========================

  fileserch(String query) async {
    List<Ads> dummylistdata = <Ads>[];
    if (query.isNotEmpty && dummysearch!.isNotEmpty) {
      dummysearch!.forEach((item) {
        var service = item;
        if (service.adName!.toLowerCase().contains(query.toLowerCase()) ||
            service.adDescription!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            service.adPrice!
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase())) {
          dummylistdata.add(service);
        }
      });
      inspect(dummylistdata);
      fullads.clear();
      fullads.addAll(dummylistdata);
      // update();
    } else {
      // print(dummysearch!.length);
      fullads.clear();
      fullads.addAll(dummysearch!);
      // update();
    }
  }
  //=============  ===================================================
  //=============  =================filter    ========================

  // filter(String query) async {
  //   List<Ads> dummylistdata = <Ads>[];
  //   if (query.isNotEmpty && dummysearch!.isNotEmpty) {
  //     dummysearch!.forEach(
  //       (item) {
  //         if (item.adtypename!.adTypeName!.contains(query)) {
  //           dummylistdata.add(item);
  //         }
  //       },
  //     );
  //     fullads.clear();
  //     fullads.addAll(dummylistdata);
  //     // update();
  //   } else {
  //     // print(dummysearch!.length);
  //     fullads.clear();
  //     fullads.addAll(dummysearch!);
  //     // update();
  //   }
  // }

  //===================================================================
  filterads(String query) async {
    List<Ads> dummylistdata = <Ads>[];
    if (query.isNotEmpty && dummysearch!.isNotEmpty) {
      dummysearch!.forEach((item) {
        if (item.adtypename!.adTypeName!.contains(query)) {
          dummylistdata.add(item);
        }
      });
      fullads.clear();
      fullads.addAll(dummylistdata);
      // update();
    } else {
      print(dummysearch!.length);
      fullads.clear();
      fullads.addAll(dummysearch!);
      // update();
    }
  }

  //====================================================================
  fdatamyad() async {
    isLoadingMyAds.value = true;
    List<Ads> myad = await ApiService.fdataMyad();
    myads.value = myad;
    isLoadingMyAds.value = false;
  }

  fetchFavoriteAdds() async {
    isLoadingFavorite.value = true;
    favad.value = await ApiService.myfavorite();
    isLoadingFavorite.value = false;
  }

  fetchAllCategoryById(int id) async {
    isLoadingAllAds.value = true;
    List<Ads> adby = await ApiService.fdatahomeads(id);
    allAds.value = adby;
    isLoadingAllAds.value = false;
    dummysearchHome = allAds.toList();
  }

  //==================================searchHome========================

  fileserchHome(String query) async {
    List<Ads> dummylistdataHome = <Ads>[];
    if (query.isNotEmpty && dummysearchHome!.isNotEmpty) {
      dummysearchHome!.forEach((item) {
        var serviceHome = item;
        if (serviceHome.adName!.toLowerCase().contains(query.toLowerCase()) ||
            serviceHome.adDescription!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            serviceHome.adPrice!
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase())) {
          dummylistdataHome.add(serviceHome);
        }
      });
      allAds.clear();
      allAds.addAll(dummylistdataHome);
      // update();
    } else {
      // print(dummysearchHome!.length);
      allAds.clear();
      allAds.addAll(dummysearchHome!);
      // update();
    }
  }

  //====================================================================
  var categoryList = [].obs;
  RxBool isLoadingCL = false.obs;
  fetchCatogaryList(int a, int c) async {
    print("adCatogaryId =>" +
        a.toString() +
        "    ---    " +
        "catogaryDetailsId =>" +
        c.toString());
    isLoadingCL.value = true;
    List<CategoryModel>? allCategory = await ApiService.fdataCategory(a, c);
    inspect(allCategory);
    categoryList.value = allCategory ?? [];
    isLoadingCL.value = false;
  }
}
