import 'package:flutter/material.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Pages/privacy_and_terms.dart';
import 'package:for_sale/Sign-in/Verify-account_view.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

class Signin extends GetView<UserController> {
  //
  // final TextEditingController? nums = TextEditingController();
  // //
  // final _key = GlobalKey<FormState>();
  //
  // String? x;
  //
  @override
  Widget build(BuildContext context) {
    // controller.numc.dispose();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        centerTitle: true,
        title: Text(
          //'تسجيل الدخول',
          'Signin_Appbar'.tr,
          style: Get.textTheme.headline1!,
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(Get.context!).brightness == Brightness.dark
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2))
          ],
          color: Get.theme.primaryColor,
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
                    style: Get.textTheme.bodyText1!,
                  ),
                  padding: EdgeInsets.only(bottom: 11),
                ),
                Padding(
                  child: Text(
                    'Signin_Label2'.tr,
                    style: Get.textTheme.bodyText1!,
                  ),
                  padding: EdgeInsets.only(bottom: 23),
                ),
                Padding(
                  child: Text(
                    'Signin_Label3'.tr,
                    style: Get.textTheme.bodyText1!,
                  ),
                  padding: EdgeInsets.only(bottom: 9),
                ),
                Sform(),
                // Form(
                //   key: controller.keyN,
                //   child: TextFormField(
                //     controller: controller.numc,
                //     // autofocus: true,
                //     keyboardType: TextInputType.number,
                //     //
                //     validator: (val) =>
                //         (val!.length == 0 ? 'Input Phone Number Please' : null),
                //     //
                //     onSaved: (x) => controller.num = x,
                //     decoration: InputDecoration(
                //       border: new OutlineInputBorder(
                //           borderSide: new BorderSide(color: Color(0xFF231F1F)),
                //           borderRadius: BorderRadius.circular(4)),
                //       hintText: "789 456 123",
                //       hintStyle: TextStyle(
                //         fontSize: 12,
                //         // color: Color(0xFF333333),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  child: Wrap(
                    // runSpacing: 0,
                    // spacing: 0,
                    // runAlignment: WrapAlignment.end,
                    children: [
                      Text(
                        'Signin_Label4'.tr,
                        style: Get.textTheme.bodyText1!,
                      ).paddingZero,
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Get.to(PrivacyAndTerms());
                        },
                        child: Text(
                          'Signin_Label5'.tr,
                          style: Get.theme.textTheme.bodyText1!.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 11),
                        ),
                      ).paddingZero
                    ],
                  ),
                  padding: EdgeInsets.only(bottom: 20, top: 10),
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
                      //
                      // if (controller.num?.isEmpty ?? true) {
                      //   // Get.snackbar(
                      //   //   "", "",
                      //   //   titleText: Center(
                      //   //     child: Text(
                      //   //       'Signin_Validation'.tr,
                      //   //       style: TextStyle(
                      //   //           fontSize: 20, fontWeight: FontWeight.bold),
                      //   //     ),
                      //   //   ),
                      //   //   //snackPosition: SnackPosition.BOTTOM,
                      //   //   backgroundColor: Colors.grey[10],
                      //   //   borderColor: Colors.black,
                      //   //   borderWidth: 1,
                      //   // );
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //         content: Text('يرجى إدخال   الرقم أولا')),
                      //   );
                      //   return;
                      // } else {
                      if (controller.keyN.currentState!.validate()) {
                        controller.keyN.currentState!.save();

                        // c.user.value.info!.accountPhoneNumber =
                        //     num.text.toString();
                        ApiService.register(controller.num!);
                        Get.off(() => VerifyAccount());
                        //
                        //
                      }
                    },
                    child: Text(
                      'Signin_Button'.tr,
                      style: Get.textTheme.bodyText1!,
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

class Sform extends StatefulWidget {
  var c = Get.find<UserController>();
  @override
  _SformState createState() => _SformState();
  //
}

class _SformState extends State<Sform> {
  //
  @override
  void initState() {
    widget.c.numc = TextEditingController();
    widget.c.num = "";
    super.initState();
  }

  //
  @override
  void dispose() {
    widget.c.numc.dispose();

    // widget.c.num = null;
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.c.keyN,
      child: TextFormField(
        controller: widget.c.numc,
        style: Get.theme.textTheme.bodyText1,
        // autofocus: true,
        onSaved: (g) => widget.c.num = g,
        keyboardType: TextInputType.number,
        validator: (val) =>
            (val!.length == 0 ? 'Input Phone Number Please' : null),
        //
        //     onSaved: (x) => controller.num = x,
        decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xFF231F1F)),
              borderRadius: BorderRadius.circular(4)),
          hintText: "789 456 123",
          hintStyle: Get.theme.textTheme.bodyText1,
        ),
      ),
    );
  }
}
