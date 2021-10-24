import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/Category-page/view.dart';
import 'package:for_sale/Home/allAds.dart';
import 'package:for_sale/Model/home.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  //
  //
  @override
  Widget build(BuildContext context) {
    //
    final Size size = MediaQuery.of(context).size;
    //
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home_Page".tr, style: klabelAppbarStyle)),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return await controller.fetchHomeList();
        },
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                controller.isLoading1.value
                    ? controller.homeList.isEmpty
                        ? Text("empty".tr)
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.homeList.length,
                            itemBuilder: (context, indexF) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      start: 16,
                                      end: 16,
                                      top: 20,
                                    ),
                                    child: containerTitle(
                                      controller.homeList[indexF].adCatogaryName
                                          .toString(),
                                      controller.homeList[indexF].adCatogaryId!,
                                    ),
                                  ),
                                  Container(
                                    height: 140,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, indexL) =>
                                          containerCategory(
                                        name: controller.homeList[indexF]
                                            .catogaryDetails![indexL],
                                        title: controller
                                            .homeList[indexF].adCatogaryName
                                            .toString(),
                                        img: controller.homeList[indexF]
                                            .catogaryDetails![indexL].picture,
                                      ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(width: 5),
                                      itemCount: controller.homeList[indexF]
                                          .catogaryDetails!.length,
                                    ),
                                  ),
                                  controller.isLoading1.value
                                      ? controller.homeList[indexF].ads!.isEmpty
                                          ? Text("empty".tr)
                                          : Container(
                                              height: 270.0,
                                              child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                  ),
                                                  child: containerOffer(
                                                    context,
                                                    size,
                                                    disc: controller
                                                        .homeList[indexF]
                                                        .ads![index]
                                                        .adName,
                                                    price: controller
                                                        .homeList[indexF]
                                                        .ads![index]
                                                        .adPrice,
                                                    image: controller
                                                        .homeList[indexF]
                                                        .ads![index]
                                                        .adpicture![0]
                                                        .adPicture,
                                                    time:
                                                        'قبل : ${(DateTime.now().difference(
                                                              DateTime(
                                                                int.parse(controller
                                                                    .homeList[
                                                                        indexF]
                                                                    .ads![index]
                                                                    .createdAt!
                                                                    .substring(
                                                                        0, 4)),
                                                                int.parse(controller
                                                                    .homeList[
                                                                        indexF]
                                                                    .ads![index]
                                                                    .createdAt!
                                                                    .substring(
                                                                        5, 7)),
                                                                int.parse(controller
                                                                    .homeList[
                                                                        indexF]
                                                                    .ads![index]
                                                                    .createdAt!
                                                                    .substring(
                                                                        8, 10)),
                                                                int.parse(controller
                                                                    .homeList[
                                                                        indexF]
                                                                    .ads![index]
                                                                    .createdAt!
                                                                    .substring(
                                                                        11,
                                                                        13)),
                                                              ),
                                                            ).inDays)}  يوم  ',
                                                    indexC: indexF,
                                                    indexA: index,
                                                  ),
                                                ),
                                                itemCount: controller
                                                    .homeList[indexF]
                                                    .ads!
                                                    // .adDescription!
                                                    .length,
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(width: 4),
                                              ),
                                            )
                                      : CircularProgressIndicator(),
                                ],
                              );
                            },
                          )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerTitle(String title, int id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: klabelStyleTitle.copyWith(color: Colors.black)),
        Row(
          children: [
            InkWell(
                child: Text("view all".tr, style: klabelStyleShowAll),
                onTap: () {
                  print('idcathome $id');
                  Get.find<AdsController>().fetchAllCategoryById(id);
                  Get.to(() => AdsAll());
                }),
            Icon(Icons.chevron_right_sharp, color: Colors.blue, size: 15),
          ],
        ),
      ],
    );
  }

  Widget containerCategory(
      {CatogaryDetails? name, String? title, String? img}) {
    return TextButton(
      child: Container(
        height: 140.0,
        width: 110.0,
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).primaryColor == Colors.black
              ? Colors.black
              : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      topLeft: Radius.circular(4),
                    ),
                    child: img != null
                        ? Image.network(
                            img,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Center(
                                child: const Text(
                                  'Empty',
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            },
                            //width: double.infinity,
                            // "https://www.wallpapertip.com/wmimgs/167-1679333_asus-rog-wallpaper-4k-asus-rog-gaming-4k.jpg",
                            loadingBuilder: (BuildContext? ctx, Widget? child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child!;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.green),
                                  ),
                                );
                              }
                            },
                          )
                        : Container()),
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
        Get.find<AdsController>()
            .fetchCatogaryList(name.adCatogaryId, name.catogaryDetailsId);
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

  Widget containerOffer(context, size,
      {disc, price, String? time, image, indexC, indexA}) {
    return InkWell(
      onTap: () {
        Get.to(
          () => Adsdetails(
            temp: Get.find<HomeController>().homeList[indexC].ads![indexA],
          ),
        );
      },
      child: Container(
        width: 210,
        height: 218,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor == Colors.black
              ? Colors.black
              : Colors.white,
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        child: Column(
          children: [
            //image
            Expanded(
              child: Image.network(
                  // "https://www.wallpapertip.com/wmimgs/167-1679333_asus-rog-wallpaper-4k-asus-rog-gaming-4k.jpg",

                  image, errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                return Center(
                  child: const Text(
                    'Empty',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
                  //
                  loadingBuilder: (BuildContext? ctx, Widget? child,
                      ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child!;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  );
                }
              }
                  // fit: BoxFit.cover,
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
                        time!.split("T")[0].toString(),
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
      ),
    );
  }
}
