import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  var ads = <AdsModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fdata();
  }

  fdata() async {
    List<AdsModel> ad = await ApiService.fdataAds();
    ads.value = ad;
  }
}
