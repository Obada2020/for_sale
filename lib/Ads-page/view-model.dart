import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/Home/model.dart';
import 'package:for_sale/My-ads/model.dart';
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
  var myads = <MyAdsModel>[].obs;
  var favad = <FavoriteModel>[].obs;
  var adsHome = <AdsHomeModel>[].obs;
  List<AdsModel>? dummysearch;
  List<AdsHomeModel>? dummysearchHome;

  bool isFirst = true;
  var accountID;
  @override
  void onInit() {
    super.onInit();
    fdatadadshome(adcatogaryid);
    fdatamyad();
    fdatafavad();
  }

  fdatadsbynamescrl(a, c, d) async {
    print("fffffffffffffffffffffffffffff");
    print(a.toString() + " " + c.toString() + " " + d.toString());
    List<AdsModel> adby = await ApiService.fdataAdsNameScrl(
      a.toString(),
      c.toString(),
      d.toString(),
    );
    fullads.value = adby;
    scrl.value = adby;
    ads.value = adby;
    dummysearch = ads.toList();
  }

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
  fdatamyad() async {
    List<MyAdsModel> myad = await ApiService.fdataMyad();
    myads.value = myad;
  }

  fdatafavad() async {
    List<FavoriteModel> fav = await ApiService.fdatafavad();
    favad.value = fav;
  }

  fdatadadshome(adcatogaryid) async {
    print('idcatctrl $adcatogaryid');
    List<AdsHomeModel> adby = await ApiService.fdatahomeads(adcatogaryid);
    adsHome.value = adby;
    dummysearchHome = adsHome.toList();
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
            serviceHome.adPrice!.toLowerCase().contains(query.toLowerCase())) {
          dummylistdataHome.add(serviceHome);
        }
      });
      adsHome.clear();
      adsHome.addAll(dummylistdataHome);
      update();
    } else {
      print(dummysearchHome!.length);
      adsHome.clear();
      adsHome.addAll(dummysearchHome!);
      update();
    }
  }
  //====================================================================
}
