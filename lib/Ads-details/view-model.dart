import 'package:for_sale/Api/ApiService.dart';
import 'package:get/get.dart';

class AddFavController extends GetxController {
  var result = false.obs;
  @override
  void onInit() {
    super.onInit();
    // fdata();
  }

  fdata() async {
    bool res = await ApiService.fdatacdfav();
    result.value = res;
    print('result ctrl==  $res');
    return res;
  }
}
