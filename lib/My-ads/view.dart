import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/My-ads/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class MyAds extends StatelessWidget {
  AdsController c = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              'إعلاناتي',
              style: klabelAppbarStyle,
            ),
          ),
        ),
      ),
      body: //================================grid view==========================

          gridview(),
    );
  }

  Widget gridview() {
    return Container(
      margin: EdgeInsets.only(top: 16, right: 16, left: 16),
      child: GetX<AdsController>(
        builder: (controller) {
          if (controller.myads.isNotEmpty) {
            return GridView.builder(
                shrinkWrap: true,
                itemCount: controller.myads.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Map details = {
                        'adId': c.myads[index].adId,
                        'accountId': c.myads[index].accountId,
                        'adName': c.myads[index].adName,
                        'adphone': c.myads[index].adPhoneNumber,
                        'addescr': c.myads[index].adDescription,
                        'adpicture': c.myads[index].adPicture,
                        'adprice': c.myads[index].adPrice,
                        'adinfo': c.myads[index].adInfo,
                        'created': c.myads[index].createdAt,
                        'updated': c.myads[index].updatedAt,
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
                                  controller.myads[index].adPicture.toString(),
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
                              controller.myads[index].adName!,
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
                                      borderRadius: BorderRadius.circular(4),
                                      gradient: kGColor),
                                  child: Text(
                                    controller.myads[index].adPrice.toString(),
                                    style: klabelStyleBold11light,
                                  )),
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
                });
          } else {
            return Center(
                child: Container(
              child: CircularProgressIndicator(),
            ));
          }
        },
      ),
    );
  }
}
