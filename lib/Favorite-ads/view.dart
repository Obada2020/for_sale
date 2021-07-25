import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class FavoriteAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbodyColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              'الإعلانات المفضلة',
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
        init: AdsController(),
        builder: (controller) {
          if (controller.favad != null) {
            return GridView.builder(
                shrinkWrap: true,
                itemCount: controller.favad.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(Adsdetails(), arguments: index);
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
                                  controller.favad[0].ad![index].adPicture!
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
                              controller.favad[0].ad![index].adname!,
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
                                    controller.favad[0].ad![index].adPrice
                                        .toString(),
                                    style: klabelStyleBold11light,
                                  )),
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
