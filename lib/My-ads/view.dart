import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class MyAds extends GetView<AdsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        centerTitle: true,
        title: Text(
          'MyAccount_Label4'.tr,
          style: Get.textTheme.headline1!,
        ),
      ),
      body: SingleChildScrollView(child: gridview()),
    );
  }

  Widget gridview() {
    controller.fdatamyad();
    return Obx(
      () => RefreshIndicator(
        onRefresh: () {
          return controller.fdatamyad();
        },
        child: Container(
          height: Get.height,
          margin: EdgeInsets.only(top: 16, right: 16, left: 16),
          child: controller.isLoadingMyAds.value
              ? Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                )
              : controller.myads.isEmpty
                  ? Center(
                      child: Text(
                        "emptymyad".tr,
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : GridView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.myads.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 9,
                        mainAxisSpacing: 9,
                      ),
                      itemBuilder: (context, index) {
                        // print(controller.favad[1].ad![0].adname);
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => Adsdetails(
                                temp: controller.myads[index],
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: Colors.grey.withOpacity(0.2),
                                )
                              ],
                              color:
                                  Theme.of(context).primaryColor == Colors.black
                                      ? Colors.black
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //----------card grid-----------
                                Expanded(
                                  child: Image.network(
                                      controller
                                          .myads[index].adpicture![0].adPicture
                                          .toString(),
                                      fit: BoxFit.cover, errorBuilder:
                                          (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                    return Center(
                                      child:  Text(
                                        'Empty',
                                        style: Get.theme.textTheme.bodyText1
                                      ),
                                    );
                                  },
                                      //
                                      loadingBuilder: (BuildContext? ctx,
                                          Widget? child,
                                          ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child!;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.green),
                                        ),
                                      );
                                    }
                                  }),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    right: 7,
                                    top: 3,
                                  ),
                                  child: Text(
                                    controller.myads[index].adName!,
                                    style: Get.textTheme.bodyText1!,
                                    maxLines: 2,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: 5, bottom: 5, left: 10),
                                      padding: EdgeInsets.only(
                                        left: 5,
                                        right: 6,
                                        top: 3,
                                        bottom: 4,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: kGColor),
                                      child: Text(
                                        controller.myads[index].adPrice
                                            .toString(),
                                        style: Get.textTheme.bodyText1!,
                                      ),
                                    ),
                                    Text(
                                      ('قبل : ${(DateTime.now().difference(DateTime(
                                            int.parse(controller
                                                .myads[index].createdAt!
                                                .substring(0, 4)),
                                            int.parse(controller
                                                .myads[index].createdAt!
                                                .substring(5, 7)),
                                            int.parse(controller
                                                .myads[index].createdAt!
                                                .substring(8, 10)),
                                            int.parse(controller
                                                .myads[index].createdAt!
                                                .substring(11, 13)),
                                          )).inDays)}  يوم  '),
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontFamily: 'FairuzBold',
                                          fontSize: 10,
                                          color: Color(0xFF5E5E5E)),
                                    ),
                                    // Text(controller.ads[index].createdAt!
                                    //     .substring(11, 13))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
