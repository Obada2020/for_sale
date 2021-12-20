import 'package:flutter/material.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:get/get.dart';
import '../constant/constant.dart';

class PrivacyAndTerms extends GetView<HomeController> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        centerTitle: true,
        title: Text(
          'PrivacyAndTerms_Appbar'.tr,
          style: Get.textTheme.headline1!,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          // color: Colors.red,
          padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  'PrivacyAndTerms_Label1'.tr,
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    fontFamily: 'FairuzBlack',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Obx(
                  () => Text(
                    controller.terms.value,
                    style: Get.theme.textTheme.bodyText1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
