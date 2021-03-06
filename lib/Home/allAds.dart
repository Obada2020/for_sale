import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class AdsAll extends GetView<AdsController> {
  final String? title;
  final String? title2;
  final TextEditingController serc = TextEditingController();
  AdsAll({this.title, this.title2});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: kbodyColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                title != null ? title.toString() + " " + title2.toString() : '',
                style: Get.textTheme.headline1!,
              ),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: BoxDecoration(gradient: kGColor),
              ),
              serch(size),
            ],
          ),
        ),
      ),
      body: gridview(),
    );
  }

  //================================ serch  ==========================
  Widget serch(Size size) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15, bottom: 12, top: 95),
      padding: EdgeInsets.only(right: 15, left: 15),
      width: size.width,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xffF2F2F2),
      ),
      child: TextField(
        onChanged: (txt) {
          controller.fileserchHome(txt);
        },
        style : Get.theme.textTheme.bodyText1,
        decoration: InputDecoration(
          hintText: title != null ? " ابحث عن   ${title2!.toString()}" : 'ابحث',
          hintStyle: TextStyle(
              fontFamily: 'FairuzBlack',
              fontSize: 14,
              color: Color(0xFF333333)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  //================================grid view=========================
  Widget gridview() {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 16, left: 16),
      child: Obx(
        () => Container(
          child: controller.isLoadingAllAds.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.allAds.isEmpty
                  ? Center(
                      child: Text('empty'.tr,
                          style: Get.theme.textTheme.bodyText1),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.allAds.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 9,
                        mainAxisSpacing: 9,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Map details = {
                            //   // 'adId': controller.allAds[index].adId,
                            //   // 'accountId': controller.allAds[index].accountId,
                            //   // 'adName': controller.allAds[index].adName,
                            //   // 'adphone': controller.allAds[index].adPhoneNumber,
                            //   // 'addescr': controller.allAds[index].adDescription,
                            //   // 'adpicture': controller.allAds[index].adPicture,
                            //   // 'adprice': controller.allAds[index].adPrice,
                            //   // 'adinfo': controller.allAds[index].adInfo,
                            //   // 'created': controller.allAds[index].createdAt,
                            //   // 'updated': controller.allAds[index].updatedAt,
                            // };
                            Get.to(() =>
                                Adsdetails(temp: controller.allAds[index]));
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
                              color: Get.theme.primaryColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    controller
                                        .allAds[index].adpicture![0].adPicture
                                        .toString(),
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Center(
                                        child: Text('Empty',
                                            style:
                                                Get.theme.textTheme.bodyText1),
                                      );
                                    },
                                    //width: double.infinity,
                                    // "https://www.wallpapertip.com/wmimgs/167-1679333_asus-rog-wallpaper-4k-asus-rog-gaming-4k.jpg",
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
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    right: 7,
                                    top: 3,
                                  ),
                                  child: Text(
                                    controller.allAds[index].adName!,
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
                                          controller.allAds[index].adPrice
                                              .toString(),
                                          style: Get.textTheme.bodyText1!,
                                        )),
                                    Text(
                                      ('قبل : ${(DateTime.now().difference(DateTime(
                                            int.parse(controller
                                                .allAds[index].createdAt!
                                                .substring(0, 4)),
                                            int.parse(controller
                                                .allAds[index].createdAt!
                                                .substring(5, 7)),
                                            int.parse(controller
                                                .allAds[index].createdAt!
                                                .substring(8, 10)),
                                            int.parse(controller
                                                .allAds[index].createdAt!
                                                .substring(11, 13)),
                                          )).inDays)}  يوم  '),
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontFamily: 'FairuzBold',
                                        fontSize: 10,
                                        color: Color(
                                          0xFF5E5E5E,
                                        ),
                                      ),
                                    ),
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
