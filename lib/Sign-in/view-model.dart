import 'package:for_sale/Api/ApiService.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart';

class UserController extends GetxController {
  //
  @override
  void onInit() {
    super.onInit();
    getPreferences();
  }

  //
  Rx<String> number = "".obs;
  //
  Rx<String> token = "".obs;
  //
  Rx<UserModel> user = UserModel().obs; // for sharedPreferences
  //
  setPreferences(numb, tok) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("number", numb);
    sharedPreferences.setString("token", tok);
    number.value = numb;
    token.value = tok;
  }

  //
  getPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    number.value = sharedPreferences.getString("number")!;
    token.value = sharedPreferences.getString("token")!;
    print("success");
    print(number);
    print(token);
  }

  //
  deletePreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await ApiService.logout();
    sharedPreferences.remove("number");
  }

  //
  Future login(number, serialNumber) async {
    var result = await ApiService.login(number, serialNumber);
    if (result != "Login Error") {
      user.value = result;
      setPreferences(number, result.token);
    }
    return result;
  }
}
