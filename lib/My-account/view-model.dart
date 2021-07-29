import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountController extends GetxController {
  Rx<String> number = "".obs;
  @override
  void onInit() {
    super.onInit();
    getNumber();
  }

  getNumber() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    number.value = sharedPreferences.getString("number")!;
  }

  deleteNumber() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("number");
  }
}
