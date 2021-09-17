import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class Ads extends StatelessWidget {
  final String? title;
  final String? title2;
  Ads({this.title, this.title2});
  final AdsController c = Get.find<AdsController>();
  final TextEditingController serc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: kbodyColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title != null ? title.toString() + " " + title2.toString() : '',
          style: klabelAppbarStyle,
        ),
        flexibleSpace: Container(
          // decoration: BoxDecoration(gradient: kGColor),
          color: kGColor.colors.last,
          // child: serch(size),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              // decoration: BoxDecoration(gradient: kGColor),
              color: kGColor.colors.first,
              child: serch(),
              padding: EdgeInsets.all(14),
            ),
            Obx(
              () => Container(
                width: size.width,
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, int index) {
                    return RawMaterialButton(
                      onPressed: () {
                        c.selectIndex.value = index;
                        c.filter(c.scrl[index].toString());
                      },
                      child: Obx(
                        () => Container(
                          margin: EdgeInsets.fromLTRB(13, 10, 13, 14),
                          padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff333333)),
                              gradient: c.selectIndex.value == index
                                  ? kGColor
                                  : LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffF2F2F2),
                                        Color(0xffF2F2F2),
                                      ],
                                    ),
                              color: Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            "${c.scrl[index]}",
                            style: c.selectIndex.value == index
                                ? klabelStyleBold11light
                                : klabelStyleBold11dark,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: c.scrl.length,
                ),
              ),
            ),
            Obx(
              () => Container(
                child: c.isLoadingAllAds.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : c.ads.isEmpty
                        ? Center(
                            child: Text("empty".tr),
                          )
                        : GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: c.ads.length,
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
                                  // inspect(c.ads[index].);
                                  // Map details = {
                                  //   'adId': c.allAds[index].adId,
                                  //   'accountId': c.allAds[index].accountId,
                                  //   'adName': c.allAds[index].adName,
                                  //   'adphone': c.allAds[index].adPhoneNumber,
                                  //   'addescr': c.allAds[index].adDescription,
                                  //   'adpicture': c.allAds[index].adpicture,
                                  //   'adprice': c.allAds[index].adPrice,
                                  //   'adinfo': c.allAds[index].adInfo,
                                  //   'created': c.allAds[index].createdAt,
                                  //   'updated': c.allAds[index].updatedAt,
                                  // };
                                  Get.to(() => Adsdetails(
                                        // details: details,
                                        temp: c.allAds[index],
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
                                    color: c.ads[index].adTypeId == 2
                                        ? Color(0x79667590)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                          c.ads[index].adpicture![0].adPicture
                                              .toString(),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 5,
                                          right: 7,
                                          top: 3,
                                        ),
                                        child: Text(
                                          c.ads[index].adName!,
                                          style: klabelStyleBold12card,
                                          maxLines: 2,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(
                                                  right: 5,
                                                  bottom: 5,
                                                  left: 10),
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
                                                c.ads[index].adPrice.toString(),
                                                style: klabelStyleBold11light,
                                              )),
                                          Text(
                                            ('قبل : ${(DateTime.now().difference(DateTime(
                                                  int.parse(c
                                                      .ads[index].createdAt!
                                                      .substring(0, 4)),
                                                  int.parse(c
                                                      .ads[index].createdAt!
                                                      .substring(5, 7)),
                                                  int.parse(c
                                                      .ads[index].createdAt!
                                                      .substring(8, 10)),
                                                  int.parse(c
                                                      .ads[index].createdAt!
                                                      .substring(11, 13)),
                                                )).inDays)}  يوم  '),
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontFamily: 'FairuzBold',
                                                fontSize: 10,
                                                color: Color(0xFF5E5E5E)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
              ),
            )
          ],
        ),
      ),
    );
  }

  //================================ serch  ==========================
  Widget serch() {
    return Container(
      // margin: EdgeInsets.only(right: 15, left: 15, bottom: 12, top: 95),
      // padding: EdgeInsets.only(right: 15, left: 15),
      width: Get.width,
      // height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xffF2F2F2),
      ),
      child: TextField(
        onChanged: (txt) {
          c.fileserch(txt);
        },
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
      margin: EdgeInsets.only(top: 65, right: 16, left: 16),
      child: Obx(() => Container(
            child: c.ads.length != 0
                ? GridView.builder(
                    shrinkWrap: true,
                    itemCount: c.ads.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 9,
                      mainAxisSpacing: 9,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Map details = {
                          //   'adId': c.ads[index].adId,
                          //   'accountId': c.ads[index].accountId,
                          //   'adName': c.ads[index].adName,
                          //   'adphone': c.ads[index].adPhoneNumber,
                          //   'addescr': c.ads[index].adDescription,
                          //   'adpicture': c.ads[index].adPicture,
                          //   'adprice': c.ads[index].adPrice,
                          //   'adinfo': c.ads[index].adInfo,
                          //   'created': c.ads[index].createdAt,
                          //   'updated': c.ads[index].updatedAt,
                          // };
                          Get.to(
                            () => Adsdetails(
                              temp: c.ads[index],
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
                            color: c.ads[index].adTypeId == 2
                                ? Color(0x79667590)
                                : Colors.white,
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
                                    c.ads[index].adpicture![0].adPicture
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                  right: 7,
                                  top: 3,
                                ),
                                child: Text(
                                  c.ads[index].adName!,
                                  style: klabelStyleBold12card,
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
                                        c.ads[index].adPrice.toString(),
                                        style: klabelStyleBold11light,
                                      )),
                                  Text(
                                    ('قبل : ${(DateTime.now().difference(DateTime(
                                          int.parse(c.ads[index].createdAt!
                                              .substring(0, 4)),
                                          int.parse(c.ads[index].createdAt!
                                              .substring(5, 7)),
                                          int.parse(c.ads[index].createdAt!
                                              .substring(8, 10)),
                                          int.parse(c.ads[index].createdAt!
                                              .substring(11, 13)),
                                        )).inDays)}  يوم  '),
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontFamily: 'FairuzBold',
                                        fontSize: 10,
                                        color: Color(0xFF5E5E5E)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          )),
    );
  }
}
