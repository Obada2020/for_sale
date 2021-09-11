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
          style: klabelAppbarStyle,
        ),
      ),
      body: //================================grid view==========================

          gridview(),
    );
  }

  Widget gridview() {
    controller.fdatamyad();
    return Obx(
      () => RefreshIndicator(
        onRefresh: () {
          return controller.fdatamyad();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            height: Get.height,
            // margin: EdgeInsets.only(top: 16, right: 16, left: 16),
            child: controller.isLoadingMyAds.value
                ? Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : controller.favad.isEmpty
                    ? Center(
                        child: Text(
                        "emptymyad".tr,
                        style: TextStyle(fontSize: 20),
                      ))
                    : GridView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.favad.length,
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
                              Map details = {
                                'adId': controller.favad[index].adId,
                                'accountId': controller.favad[index].accountId,
                                'adName': controller.favad[index].ad![0].adname,
                                'adphone': controller
                                    .favad[index].ad![0].adPhoneNumber,
                                'addescr': controller
                                    .favad[index].ad![0].adDescription,
                                'adpicture':
                                    controller.favad[index].ad![0].adPicture,
                                'adprice':
                                    controller.favad[index].ad![0].adPrice,
                                'created':
                                    controller.favad[index].ad![0].createdAt,
                                'updated':
                                    controller.favad[index].ad![0].updatedAt,
                              };
                              Get.to(() => Adsdetails(
                                    details: details,
                                  ));
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //----------card grid-----------
                                  Container(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          topLeft: Radius.circular(4),
                                        ),
                                        child: Image.network(
                                          controller
                                              .favad[index].ad![0].adPicture!
                                              .toString(),
                                          fit: BoxFit.cover,
                                        )),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 5,
                                      right: 7,
                                      top: 3,
                                    ),
                                    child: Text(
                                      controller.favad[index].ad![0].adname!,
                                      style: klabelStyleBold12,
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
                                          controller.favad[index].ad![0].adPrice
                                              .toString(),
                                          style: klabelStyleBold11light,
                                        ),
                                      ),
                                      Text(
                                        ('قبل : ${(DateTime.now().difference(DateTime(
                                              int.parse(controller
                                                  .favad[index].createdAt!
                                                  .substring(0, 4)),
                                              int.parse(controller
                                                  .favad[index].createdAt!
                                                  .substring(5, 7)),
                                              int.parse(controller
                                                  .favad[index].createdAt!
                                                  .substring(8, 10)),
                                              int.parse(controller
                                                  .favad[index].createdAt!
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
      ),
    );
  }
}
