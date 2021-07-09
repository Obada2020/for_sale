import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';
import 'listhorizonal.dart';

class Ads extends StatelessWidget {
  AdsController adsController = Get.put(AdsController());
  TextEditingController serc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbodyColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
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
                'سيارات BMW',
                style: klabelAppbarStyle,
              ),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: BoxDecoration(gradient: kGColor),
              ),
              Container(
                margin:
                    EdgeInsets.only(right: 15, left: 15, bottom: 12, top: 95),
                padding: EdgeInsets.only(right: 15, left: 15),
                width: size.width,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffF2F2F2),
                ),
                child: TextField(
                  onChanged: (txt) {
                    adsController.fileserch(txt);
                  },
                  decoration: InputDecoration(
                    hintText: " ابحث عن  سيارات",
                    hintStyle: TextStyle(
                        fontFamily: 'FairuzBlack',
                        fontSize: 14,
                        color: Color(0xFF333333)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          //================================grid view==========================

          Container(
            margin:
                EdgeInsets.only(top: size.height * 0.083, right: 16, left: 16),
            child: GetBuilder<AdsController>(
                init: AdsController(),
                builder: (controller) {
                  return Container(
                      child: controller.ads.length != 0
                          ? GridView.builder(
                              shrinkWrap: true,
                              itemCount: controller.ads.length,
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2 / 2,
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
                                      color:
                                          controller.ads[index].adTypeId == '2'
                                              ? Color(0x79667590)
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //----------card grid-----------
                                        Container(
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(4),
                                                topLeft: Radius.circular(4),
                                              ),
                                              child: Image.network(
                                                controller.ads[index].adPicture
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
                                            controller.ads[index].adName!,
                                            style: klabelStyleBold12,
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
                                                        BorderRadius.circular(
                                                            4),
                                                    gradient: kGColor),
                                                child: Text(
                                                  controller.ads[index].adPrice
                                                      .toString(),
                                                  style: klabelStyleBold11light,
                                                )),
                                            Text(
                                              ('قبل : ${(DateTime.now().difference(DateTime(
                                                    int.parse(controller
                                                        .ads[index].createdAt!
                                                        .substring(0, 4)),
                                                    int.parse(controller
                                                        .ads[index].createdAt!
                                                        .substring(5, 7)),
                                                    int.parse(controller
                                                        .ads[index].createdAt!
                                                        .substring(8, 10)),
                                                    int.parse(controller
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
                              })
                          : Center(
                              child: Container(
                              child: CircularProgressIndicator(),
                            )));
                }),
          ),
          //================================list horisental=========================
          Positioned(
            child: ListHorizantol(),
          ),
        ],
      ),
    );
  }
}
