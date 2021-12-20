import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/user.dart';

class UserController extends GetxController {
  //
  @override
  void onInit() {
    super.onInit();
    // getPreferences();
  }

  //
  late TextEditingController numc;
  String? num;
  String? serial;
  var keyN = GlobalKey<FormState>();

  //
  Rx<String> number = "".obs;
  //
  Rx<String> token = "".obs;
  //
  Rx<String> accountId = "".obs;
  //
  Rx<UserModel> user = UserModel().obs; // for sharedPreferences
  //
  setPreferences(String numb, String tok, String cid) async {
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
  Future login() async {
    var result = await ApiService.login(num, serial);
    if (result != "Login Error") {
      user.value = result;
      // inspect(result);
      // print(result.info!.accountId.toString());
      await setPreferences(
          num!, result.token.toString(), result.info!.accountId.toString());
      print("Saved Successfuly");
    }
    return result;
  }
}
