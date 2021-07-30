import 'package:flutter/material.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/Ads-page/view.dart';
import 'package:for_sale/Category-page/view.dart';
import 'package:for_sale/Home/allAds.dart';
import 'package:for_sale/Home/model.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      //start appbar
      appBar: AppBar(
        title: Center(child: Text("الصفحة الرئيسة", style: klabelAppbarStyle)),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //start title category
            GetX<HomeController>(
                init: HomeController(),
                builder: (controller) {
                  return controller.homeList.length != 0
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.homeList.value.length,
                          itemBuilder: (context, indexF) {
                            controller.fdatadadshome(
                                controller.homeList[0].adCatogaryId);
                            return Column(
                              children: [
                                Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 16, end: 16, top: 20),
                                    child: containerTitle(
                                      controller
                                          .homeList.value[indexF].adCatogaryName
                                          .toString(),
                                      controller
                                          .homeList.value[indexF].adCatogaryId,
                                    )),
                                //category
                                Container(
                                  height: 140,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, indexL) =>
                                        containerCategory(
                                      name: controller.homeList.value[indexF]
                                          .catogaryDetails![indexL],
                                      title: controller
                                          .homeList.value[indexF].adCatogaryName
                                          .toString(),
                                      img: controller.homeList.value[indexF]
                                          .catogaryDetails![indexL].picture,
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 0),
                                    itemCount: controller.homeList.value[indexF]
                                        .catogaryDetails!.length,
                                  ),
                                ),
                                //offer
                                Obx(() => controller.adsHome.length != 0
                                    ? Container(
                                        height: 270.0,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              Container(
                                                padding: EdgeInsets.only(right: 8),
                                                child: containerOffer(context, size,
                                                    disc: controller.adsHome
                                                        .value[index].adName,
                                                    price: controller.adsHome
                                                        .value[index].adPrice,
                                                    image: controller.adsHome
                                                        .value[index].adPicture,
                                                    time:
                                                        'قبل : ${(DateTime.now().difference(DateTime(
                                                              int.parse(controller
                                                                  .adsHome[index]
                                                                  .createdAt!
                                                                  .substring(
                                                                      0, 4)),
                                                              int.parse(controller
                                                                  .adsHome[index]
                                                                  .createdAt!
                                                                  .substring(
                                                                      5, 7)),
                                                              int.parse(controller
                                                                  .adsHome[index]
                                                                  .createdAt!
                                                                  .substring(
                                                                      8, 10)),
                                                              int.parse(controller
                                                                  .adsHome[index]
                                                                  .createdAt!
                                                                  .substring(
                                                                      11, 13)),
                                                            )).inDays)}  يوم  '),
                                              ),
                                          itemCount: controller
                                              .adsHome
                                              .value[indexF]
                                              .adDescription!
                                              .length,
                                          separatorBuilder: (context, index) =>
                                              SizedBox(width: 4),
                                        ),
                                      )
                                    : CircularProgressIndicator())
                              ],
                            );
                          })
                      : CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }

  Widget containerTitle(String title, id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: klabelStyleTitle.copyWith(color: Colors.black)),
        Row(
          children: [
            InkWell(
                child: Text("عرض الكل", style: klabelStyleShowAll),
                onTap: () {
                  print('idcathome $id');
                  // c.fdatadadshome(id);
                  Get.to(() => AdsAll());
                }),
            Icon(Icons.chevron_right_sharp, color: Colors.blue, size: 15),
          ],
        ),
      ],
    );
  }

  Widget containerCategory({CatogaryDetail? name, String? title, String? img}) {
    return TextButton(
      child: Container(
        height: 140.0,
        width: 110.0,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      topLeft: Radius.circular(4),
                    ),
                    child: Image.network(
                      img.toString(),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(height: 11.2),
              Text(
                name!.catogaryName.toString(),
                style: klabelStyleTitleCategory,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        var parameter = {
          "title_navbar": title,
          "ad_catogary_id": name.adCatogaryId,
          "catogary_details_id": name.catogaryDetailsId
        };
        print({"home parameter =>": parameter});
        Get.to(() => CategoryPage(parameter: parameter));
      },
    );
  }

  Widget containerOffer(context, size, {disc, price, String? time, image}) {
    return Container(
      width: 210,
      height: 218,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          //image
          Expanded(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //title
                Text(
                  disc,
                  style: klabelStyleTitleCategory,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 23),
                //button and timer
                Row(
                  children: [
                    Container(
                        margin: EdgeInsetsDirectional.only(
                            start: 5, bottom: 13, end: 10),
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
                          price.toString() + " ك د",
                          style: klabelStyleBold11light,
                        )),
                    Text(
                      time!,
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
        ],
      ),
    );
  }
}
