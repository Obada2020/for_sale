import 'package:flutter/material.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

class PrivacyAndTerms extends GetView<HomeController> {
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
          'PrivacyAndTerms_Appbar'.tr,
          style: klabelAppbarStyle,
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
                  style: TextStyle(fontSize: 16, fontFamily: 'FairuzBlack'),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Obx(
                  () => Text(
                    controller.terms.value,
                    style: TextStyle(
                      fontSize: 13,
                    ),
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
