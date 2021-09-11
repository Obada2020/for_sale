import 'dart:developer';

import 'package:for_sale/Api/ApiService.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart';

class UserController extends GetxController {
  //
  @override
  void onInit() {
    super.onInit();
    // getPreferences();
  }

  //
  Rx<String> number = "".obs;
  //
  Rx<String> token = "".obs;
  //
  Rx<String> accountId = "".obs;

  Rx<UserModel> user = UserModel().obs; // for sharedPreferences
  //
  setPreferences(numb, tok, cid) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("number", numb);
    sharedPreferences.setString("token", tok);
    sharedPreferences.setString("accountId", cid);
    //
    number.value = numb;
    token.value = tok;
    accountId.value = cid;
    //
    print("success Saved");
    print(number);
    print(token);
    print(accountId);
  }

  //
  getPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    number.value = sharedPreferences.getString("number") ?? "";
    token.value = sharedPreferences.getString("token") ?? "";
    accountId.value = sharedPreferences.getString("accountId") ?? "";
    //
    print("success");
    print(number);
    print(token);
    print(accountId);
  }

  //
  deletePreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    print("Success Remove Preferences");
  }

  //
  Future login(number, serialNumber) async {
    var result = await ApiService.login(number, serialNumber);
    if (result != "Login Error") {
      user.value = result;
      // inspect(result);
      // print(result.info!.accountId.toString());
      await setPreferences(
          number, result.token.toString(), result.info!.accountId.toString());
      print("Saved Successfuly");
    }
    return result;
  }
}
