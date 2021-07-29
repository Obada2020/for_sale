import 'package:flutter/material.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Sign-in/Verify-account_view.dart';
import 'package:for_sale/Sign-in/model.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:get/get.dart';
import '../constant/constant.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    TextEditingController num = TextEditingController();
    Login c = Get.put(Login());

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        title: Center(
          child: Text(
            'تسجيل الدخول',
            style: klabelAppbarStyle,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        // width: size.width,
        // height: size.height * 0.3467966574,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 17, 12, 15),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                child: Text(
                  'تسجيل الدخول',
                  style: klabelStyleBlack14,
                ),
                padding: EdgeInsets.only(bottom: 11),
              ),
              Padding(
                child: Text(
                  ' مرحبا بك مجددا , أدخل رقم هاتفك للدخول إلى التطبيق',
                  style: klabelStyleBold11,
                ),
                padding: EdgeInsets.only(bottom: 23),
              ),
              Padding(
                child: Text(
                  'رقم الهاتف',
                  style: klabelStyleBold11,
                ),
                padding: EdgeInsets.only(bottom: 9),
              ),
              Padding(
                child: Container(
                  // height: 50,
                  child: TextFormField(
                    controller: num,
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        (val!.length == 0 ? 'This Field Is Required' : null),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Color(0xFF231F1F)),
                          borderRadius: BorderRadius.circular(4)),
                      hintText: "789 456 123",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        // color: Color(0xFF333333),
                      ),
                    ),
                  ),
                ),
                padding: EdgeInsets.only(bottom: 8),
              ),
              Padding(
                child: Text(
                  'بالنقر على متابعة ، فأنت توافق على شروط وسياسة المستخدم',
                  style: klabelStyleBold11,
                ),
                padding: EdgeInsets.only(bottom: 20),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: kGColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                // height: 41,
                child: TextButton(
                    onPressed: () async {
                      if (num.text == "") {
                        Get.snackbar(
                          "", "",
                          titleText: Center(
                            child: Text(
                              "يرجى إدخال الرقم أولا",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          //snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.grey[10],
                          borderColor: Colors.black,
                          borderWidth: 1,
                        );
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //       content: Text('يرجى إدخال الرقم أولا')),
                        // );
                        return;
                      } else {
                        // c.user.value.info!.accountPhoneNumber =
                        //     num.text.toString();
                        Get.to(() => VerifyAccount(num.text.toString()));
                        await ApiService.register(num.text);
                      }
                    },
                    child: Text(
                      'تسجيل الدخول',
                      style: kBottonSubmitStyleBold13,
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
