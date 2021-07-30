import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class AdsAll extends StatelessWidget {
  String? title;
  String? title2;
  AdsAll({this.title, this.title2});
  TextEditingController serc = TextEditingController();
  AdsController c = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbodyColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                title != null ? title.toString() + " " + title2.toString() : '',
                style: klabelAppbarStyle,
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
          c.fileserchHome(txt);
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
      margin: EdgeInsets.only(top: 5, right: 16, left: 16),
      child: Obx(() => Container(
            child: c.adsHome.length != 0
                ? GridView.builder(
                    shrinkWrap: true,
                    itemCount: c.adsHome.length,
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
                            'adId': c.adsHome[index].adId,
                            'accountId': c.adsHome[index].accountId,
                            'adName': c.adsHome[index].adName,
                            'adphone': c.adsHome[index].adPhoneNumber,
                            'addescr': c.adsHome[index].adDescription,
                            'adpicture': c.adsHome[index].adPicture,
                            'adprice': c.adsHome[index].adPrice,
                            'adinfo': c.adsHome[index].adInfo,
                            'created': c.adsHome[index].createdAt,
                            'updated': c.adsHome[index].updatedAt,
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
                            color: c.adsHome[index].adTypeId == 2
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
                                      c.adsHome[index].adPicture.toString(),
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
                                  c.adsHome[index].adName!,
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
                                        c.adsHome[index].adPrice.toString(),
                                        style: klabelStyleBold11light,
                                      )),
                                  Text(
                                    ('قبل : ${(DateTime.now().difference(DateTime(
                                          int.parse(c.adsHome[index].createdAt!
                                              .substring(0, 4)),
                                          int.parse(c.adsHome[index].createdAt!
                                              .substring(5, 7)),
                                          int.parse(c.adsHome[index].createdAt!
                                              .substring(8, 10)),
                                          int.parse(c.adsHome[index].createdAt!
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
