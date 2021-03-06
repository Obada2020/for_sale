import 'package:flutter/material.dart';
import 'package:for_sale/Add-ad/view-model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Home/navbar.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../constant/constant.dart';

//String? x = "";

// ignore: must_be_immutable
class VerifyAccount extends GetView<UserController> {
  //var c = Get.find<Login>();
  // final String number;
  // //TextEditingController Num = TextEditingController();
  // //c.user.value.info = Info();
  // // var number = Get.find<Login>().user.value.info!.accountPhoneNumber;
  // final c = Get.find<UserController>();

  // //
  // String serial = "";
  // VerifyAccount(this.number);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: kGColor),
          ),
          centerTitle: true,
          title: Text(
            'VerifyAccount_Appbar'.tr,
            style: Get.textTheme.headline1!,
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(12, 17, 12, 0),
          width: double.infinity,
          //height: size.height * 0.38,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 17, 12, 15),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      child: Text('VerifyAccount_Label1'.tr,
                          style: Get.textTheme.bodyText1!),
                      padding: EdgeInsets.only(bottom: 8),
                    ),
                    Padding(
                      child: Text(
                        //'?????? ???????????? ?????? ?????? ?????? ?????????? $number ?????????? ?????? ?????? ?????????? ???? 6 ??????????',
                        'VerifyAccount_Label2'.tr +
                            '${controller.num}' +
                            'VerifyAccount_Label3'.tr,
                        style: Get.textTheme.bodyText1!,
                      ),
                      padding: EdgeInsets.only(bottom: 30),
                    ),
                    Padding(
                      child: Container(
                        width: double.infinity,
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: OTPTextField(
                            length: 6,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            keyboardType: TextInputType.number,
                            outlineBorderRadius: 4,
                            fieldWidth: MediaQuery.of(context).size.width *
                                0.1256684492,
                            style: Get.theme.textTheme.bodyText1!,
                            otpFieldStyle: OtpFieldStyle(
                              // borderColor: Colors.white,
                              backgroundColor: Colors.grey[400]!,
                              // disabledBorderColor: Colors.black,
                              // enabledBorderColor: Colors.black,
                              focusBorderColor: Colors.blue,
                              errorBorderColor: Colors.red,
                            ),
                            onChanged: (k) {
                              print(k);
                              controller.serial = k;
                            },
                            onCompleted: (n) {
                              // controller.serial = n;
                              print(controller.serial);
                              // var z = await c.login(number, serial);
                              // if (z == "Login Error") {
                              //   showAlertDialog(context);
                              // } else {
                              //   c.user.value = z;
                              //   Get.find<AddNameController>().fetchData();
                              //   Get.offAll(
                              //     () => Home(
                              //       number:
                              //           c.user.value.info!.accountPhoneNumber,
                              //       token: c.user.value.token,
                              //     ),
                              //   );
                              // }
                              // c.login(n);
                            },
                          ),
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Padding(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('VerifyAccount_Label4'.tr,
                              style: Get.theme.textTheme.bodyText1!),
                          TextButton(
                            onPressed: () async {
                              Get.defaultDialog(
                                title: "",
                                titlePadding: EdgeInsets.all(0),
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Loading...",
                                      style: Get.theme.textTheme.bodyText1,
                                    ),
                                    CircularProgressIndicator(),
                                  ],
                                ),
                              );
                              await ApiService.register(controller.num!);
                              Get.back();
                            },
                            child: Text(
                              'VerifyAccount_Label5'.tr,
                              style: Get.textTheme.bodyText1!.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 15),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: kGColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      //height: 41,
                      child: TextButton(
                          onPressed: () async {
                            print(controller.serial!.length);
                            // print(number);
                            if (controller.serial!.length < 5) {
                              Get.snackbar(
                                "", "",
                                titleText: Center(
                                  child: Text(
                                    'VerifyAccount_Snackbar'.tr,
                                    style: Get.theme.textTheme.bodyText1,
                                  ),
                                ),
                                //snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.grey[10],
                                borderColor: Colors.black,
                                borderWidth: 1,
                              );
                              return;
                            }
                            var z = await controller.login();
                            if (z == "Login Error") {
                              showAlertDialog(context);
                            } else {
                              Get.find<AddNameController>().onInit();
                              Get.offAll(() => Home());
                            }
                          },
                          child: Text(
                            'VerifyAccount_Button'.tr,
                            style: Get.textTheme.bodyText1!,
                          )),
                    ),
                  ]),
            ),
          ),
        ));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // Widget continueButton = TextButton(
    //   child: Text("Continue"),
    //   onPressed: () {
    //     Navigator.pop(context);
    //   },
    // );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        'VerifyAccount_Check1'.tr,
        style: Get.theme.textTheme.bodyText1,
      ),
      content: Text(
        'VerifyAccount_Check2'.tr,
        style: Get.theme.textTheme.bodyText1,
      ),
      actions: [
        cancelButton,
        //continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
