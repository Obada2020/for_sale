import 'package:for_sale/Ads-details/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:get/get.dart';

class AddFavController extends GetxController {
  var result = <AddDeleteFavModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    // fdata();
  }

  fdata() async {
    List<AddDeleteFavModel> res = await ApiService.fdatacdfav();
    result.value = res;
    print('result==  $res');
  }
}
