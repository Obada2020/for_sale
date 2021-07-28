import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Sign-in/model.dart';
import 'package:get/get.dart';

class Login extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // user.value.info = Info();
  }

  //
  Rx<User> user = User().obs;
  //
  // register(phone) async {
  //   return await ApiService.register(phone);
  //   user.value.info!.serialNumber = serialNumber;
  // }
  //
  login(number, serialNumber) async {
    dynamic result = await ApiService.login(number, serialNumber);
    // print("Result = " + result);
    if (result != "Anas") {
      user.value = result;
    }
    return result;
  }
}
