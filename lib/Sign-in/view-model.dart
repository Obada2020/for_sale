import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Sign-in/model.dart';
import 'package:get/get.dart';

class Login extends GetxController {
  //
  Rx<User> user = User().obs;
  //
  register(phone) async {
    // return await ApiService.register(phone);
    // user.value.info!.serialNumber = serialNumber;
  }

  //
  login(serialNumber) async {
    // user = await ApiService.login(
    //     user.value.info!.accountPhoneNumber, serialNumber);
  }
}
