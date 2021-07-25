import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';
import 'listhorizonal.dart';

class Ads extends StatelessWidget {
  // Map? parameterAds;
  // Ads({this.parameterAds});
  AdsController c = Get.put(AdsController());
  TextEditingController serc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print("ttttttttttttttttttttttttttttttttttttttt");
    // print(parameterAds!['ad_catogary_id']);
    // adsController.addescriptionsid = parameterAds['ad_descriptions_id'];
    // adsController.catogarydetailsid = parameterAds['catogary_details_id'];
    // adsController.adtypenameid = parameterAds['title'];

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
                "parameterAds!['title']",
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
      body: Stack(
        children: [
          gridview(),
          //================================list horisental=========================
          Positioned(
            child: ListHorizantol(),
          ),
        ],
      ),
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
          c.fileserch(txt);
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
    );
  }

  //================================grid view=========================
  Widget gridview() {
    return Container(
      margin: EdgeInsets.only(top: 65, right: 16, left: 16),
      child: Obx(
          // initState: (_) => AdsController().fdatadsbynamescrl(
          //     parameterAds!['ad_catogary_id'],
          //     parameterAds!['catogary_details_id'],
          //     parameterAds!['ad_descriptions_id'],
          //     parameterAds!['title']),
          // init: AdsController(),
          // builder: (controller) {
          () => Container(
                child: c.ads.length != 0
                    ? GridView.builder(
                        shrinkWrap: true,
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
                              Get.to(() => Adsdetails(), arguments: index);
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
                                          c.ads[index].adPicture.toString(),
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
                                      c.ads[index].adname!,
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
