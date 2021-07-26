import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Home/model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var homeList = <HomeModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fdata();
  }

  fdata() async {
    List<HomeModel> myad = await ApiService.fdataHome();

    homeList.value = myad;

    print({"================>": myad});
  }
}
