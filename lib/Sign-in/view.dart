import 'package:flutter/material.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Sign-in/Verify-account_view.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    TextEditingController nums = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        centerTitle: true,
        title: Text(
          //'تسجيل الدخول',
          'Signin_Appbar'.tr,
          style: klabelAppbarStyle,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  child: Text(
                    'Signin_Label1'.tr,
                    style: klabelStyleBlack14,
                  ),
                  padding: EdgeInsets.only(bottom: 11),
                ),
                Padding(
                  child: Text(
                    'Signin_Label2'.tr,
                    style: klabelStyleBold11,
                  ),
                  padding: EdgeInsets.only(bottom: 23),
                ),
                Padding(
                  child: Text(
                    'Signin_Label3'.tr,
                    style: klabelStyleBold11,
                  ),
                  padding: EdgeInsets.only(bottom: 9),
                ),
                Padding(
                  child: TextField(
                    controller: nums,
                    // autofocus: true,
                    keyboardType: TextInputType.number,
                    // validator: (val) =>
                    //     (val!.length == 0 ? 'This Field Is Required' : null),
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
                  padding: EdgeInsets.only(bottom: 8),
                ),
                Padding(
                  child: Text(
                    'Signin_Label4'.tr,
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
                      if (nums.text == "") {
                        // Get.snackbar(
                        //   "", "",
                        //   titleText: Center(
                        //     child: Text(
                        //       'Signin_Validation'.tr,
                        //       style: TextStyle(
                        //           fontSize: 20, fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        //   //snackPosition: SnackPosition.BOTTOM,
                        //   backgroundColor: Colors.grey[10],
                        //   borderColor: Colors.black,
                        //   borderWidth: 1,
                        // );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('يرجى إدخال الرقم أولا')),
                        );
                        return;
                      } else {
                        // c.user.value.info!.accountPhoneNumber =
                        //     num.text.toString();
                        Get.to(() => VerifyAccount(nums.text.toString()));
                        await ApiService.register(nums.text);
                      }
                    },
                    child: Text(
                      'Signin_Button'.tr,
                      style: kBottonSubmitStyleBold13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}