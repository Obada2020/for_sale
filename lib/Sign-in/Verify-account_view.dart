import 'package:flutter/material.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Home/navbar.dart';
import 'package:for_sale/Home/view.dart';
import 'package:for_sale/My-account/model.dart';
import 'package:for_sale/My-account/view.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../constant/constant.dart';
import 'model.dart';

//String? x = "";

class VerifyAccount extends StatelessWidget {
  //var c = Get.find<Login>();
  String obada;
  TextEditingController Num = TextEditingController();
  //c.user.value.info = Info();
  // var number = Get.find<Login>().user.value.info!.accountPhoneNumber;
  var soso = Get.find<Login>();
  dynamic serial = "";
  VerifyAccount(this.obada);
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
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
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                'تفعيل الحساب',
                style: klabelAppbarStyle,
              ),
            ),
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
                        'تفعيل الحساب',
                        style: klabelStyleBlack14,
                      ),
                      padding: EdgeInsets.only(bottom: 8),
                    ),
                    Padding(
                      child: Text(
                        'لقد أرسلنا رمز إلى رقم جوالك $obada يحتوي على رمز تفعيل من 6 خانات',
                        style: klabelStyleBold11,
                      ),
                      padding: EdgeInsets.only(bottom: 30),
                    ),
                    Padding(
                      child: Container(
                        //height: 50,
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
                            onCompleted: (n) {
                              print(n);
                              serial = n.toString();
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
                            'لم تستلم رمز؟',
                          ),
                          TextButton(
                            onPressed: () async {
                              await ApiService.register(obada);
                            },
                            child: Text(
                              'إعادة الإرسال',
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
                            print(serial);
                            print(obada);
                            var z = await soso.login(obada, serial);
                            if (z == "Anas") {
                              showAlertDialog(context);
                            } else {
                              Get.offAll(() => Navbar());
                            }
                          },
                          child: Text(
                            'تفعيل',
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
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
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
