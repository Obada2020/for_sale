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
class VerifyAccount extends StatelessWidget {
  //var c = Get.find<Login>();
  final String number;
  //TextEditingController Num = TextEditingController();
  //c.user.value.info = Info();
  // var number = Get.find<Login>().user.value.info!.accountPhoneNumber;
  final c = Get.find<UserController>();

  //
  String serial = "";
  VerifyAccount(this.number);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: kGColor),
          ),
          centerTitle: true,
          title: Text(
            'VerifyAccount_Appbar'.tr,
            style: klabelAppbarStyle,
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
                      child: Text(
                        'VerifyAccount_Label1'.tr,
                        style: klabelStyleBlack14,
                      ),
                      padding: EdgeInsets.only(bottom: 8),
                    ),
                    Padding(
                      child: Text(
                        //'لقد أرسلنا رمز إلى رقم جوالك $number يحتوي على رمز تفعيل من 6 خانات',
                        'VerifyAccount_Label2'.tr +
                            '$number' +
                            'VerifyAccount_Label3'.tr,
                        style: klabelStyleBold11,
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
                            style: TextStyle(color: Colors.black),
                            otpFieldStyle: OtpFieldStyle(
                              backgroundColor: Theme.of(context).accentColor,
                              disabledBorderColor: Colors.white,
                              enabledBorderColor: Colors.white,
                            ),
                            onChanged: (k) {},
                            onCompleted: (n) async {
                              serial = n;
                              print(n);
                              var z = await c.login(number, serial);
                              if (z == "Login Error") {
                                showAlertDialog(context);
                              } else {
                                c.user.value = z;
                                Get.find<AddNameController>().fetchData();
                                Get.offAll(
                                  () => Home(
                                    number:
                                        c.user.value.info!.accountPhoneNumber,
                                    token: c.user.value.token,
                                  ),
                                );
                              }
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
                          Text(
                            'VerifyAccount_Label4'.tr,
                          ),
                          TextButton(
                            onPressed: () async {
                              await ApiService.register(number);
                            },
                            child: Text(
                              'VerifyAccount_Label5'.tr,
                              style: klabelStyleBold11,
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
                            print(serial.length);
                            // print(number);
                            if (serial.length < 5) {
                              Get.snackbar(
                                "", "",
                                titleText: Center(
                                  child: Text(
                                    'VerifyAccount_Snackbar'.tr,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                //snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.grey[10],
                                borderColor: Colors.black,
                                borderWidth: 1,
                              );
                              return;
                            }
                            var z = await c.login(number, serial);
                            if (z == "Login Error") {
                              showAlertDialog(context);
                            } else {
                              Get.find<AddNameController>().onInit();
                              Get.offAll(() => Home());
                            }
                          },
                          child: Text(
                            'VerifyAccount_Button'.tr,
                            style: kBottonSubmitStyleBold13,
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
      title: Text('VerifyAccount_Check1'.tr),
      content: Text('VerifyAccount_Check2'.tr),
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
