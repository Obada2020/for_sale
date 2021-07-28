import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Home/model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var homeList = <HomeModel>[].obs;
  var ads = <AdsModel>[].obs;
  int? adcatogaryid;
  HomeController({this.adcatogaryid});
  @override
  void onInit() {
    super.onInit();
    fdata();
  }

  fdatadadshome() async {
    List<AdsModel> adby = await ApiService.fdatahomeads(adcatogaryid);
    ads.value = adby;
  }

  fdata() async {
    List<HomeModel> myad = await ApiService.fdataHome();

    homeList.value = myad;

    print({"================>": myad});
  }
}
