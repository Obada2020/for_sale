import 'package:for_sale/Add-ad/view-model.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  Future dependencies() async {
    Get.put(
      HomeController(),
    );
    //
    Get.put(
      AdsController(),
    );
    //
    Get.put(
      AddNameController(),
    );
  }
}
