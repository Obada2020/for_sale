
import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Category-page/model.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/Home/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  //
  int? adcatogaryid;
  //
  int? catogarydetailsid;
  //
  int? addescriptionsid;
  //
  Rx<int> selectIndex = 0.obs;
  //
  AdsController({
    this.adcatogaryid,
    this.catogarydetailsid,
    this.addescriptionsid,
  });
  //
  var ads = <Ads>[].obs;
  RxBool isLoadingAds = false.obs;
  //
  var fullads = <Ads>[].obs;
  //
  var scrl = <String>[].obs;
  //
  var myads = <MyAdsModel>[].obs;
  //
  var favad = <FavoriteModel>[].obs;
  //
  var allAds = <AdsHomeModel>[].obs;
  //
  RxBool isLoadingAllAds = false.obs;
  //
  List<Ads>? dummysearch;
  //
  List<AdsHomeModel>? dummysearchHome;
  // bool isFirst = true;
  // var accountID;
  //
  var result = false.obs;

  //
  @override
  void onInit() {
    super.onInit();
    // fdatamyad();
    // favoriteAdd();
    // print("here initailzed the ads controller");
    // fetchFavoriteAdds();
  }

  //
  addFavorite() async {
    bool res = await ApiService.fdatacdfav();
    result.value = res;
    // print('result ctrl==  $res');
    return res;
  }

  //
  void getAdType(List<Ads> list) {
    List<String>? temp = <String>[];
    temp = list.map<String>((e) => e.adtypename!.adTypeName!).toList();
    scrl.value = temp.toSet().toList();
  }

  //
  fdatadsbynamescrl(a, c, d) async {
    // print(a.toString() + " " + c.toString() + " " + d.toString());
    isLoadingAds = true.obs;
    List<Ads> adby = await ApiService.fdataAdsNameScrl(
      a.toString(),
      c.toString(),
      d.toString(),
    );
    if (adby.isNotEmpty) ads.value = adby;
    isLoadingAds = false.obs;
    fullads.value = adby;
    getAdType(adby);
    dummysearch = ads.toList();
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
      ads.clear();
      ads.addAll(dummylistdata);
      update();
    } else {
      // print(dummysearch!.length);
      ads.clear();
      ads.addAll(dummysearch!);
      update();
    }
  }
  //====================================================================
  //==================================filter========================

  filter(String query) async {
    List<Ads> dummylistdata = <Ads>[];
    if (query.isNotEmpty && dummysearch!.isNotEmpty) {
      dummysearch!.forEach((item) {
        if (item.adtypename!.adTypeName!.contains(query)) {
          dummylistdata.add(item);
        }
      });
      ads.clear();
      ads.addAll(dummylistdata);
      update();
    } else {
      // print(dummysearch!.length);
      ads.clear();
      ads.addAll(dummysearch!);
      update();
    }
  }

  //====================================================================
  fdatamyad() async {
    List<MyAdsModel> myad = await ApiService.fdataMyad();
    myads.value = myad;
  }

  fetchFavoriteAdds() async {
    List<FavoriteModel> fav = await ApiService.myfavorite();
    favad.value = fav;
  }

  fetchAllCategoryById(int id) async {
    isLoadingAllAds.value = true;
    List<AdsHomeModel> adby = await ApiService.fdatahomeads(id);
    allAds.value = adby;
    isLoadingAllAds.value = false;
    dummysearchHome = allAds.toList();
  }

  //==================================searchHome========================

  fileserchHome(String query) async {
    List<AdsHomeModel> dummylistdataHome = <AdsHomeModel>[];
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
      update();
    } else {
      print(dummysearchHome!.length);
      allAds.clear();
      allAds.addAll(dummysearchHome!);
      update();
    }
  }

  //====================================================================
  var categoryList = [].obs;
  RxBool isLoadingCL = false.obs;
  fetchCatogaryList(a, c) async {
    isLoadingCL.value = true;
    List<CategoryModel> allCategory = await ApiService.fdataCategory(a, c);
    categoryList.value = allCategory;
    isLoadingCL.value = false;
  }
}
