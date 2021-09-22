import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/Ads-page/view.dart';
import 'package:for_sale/Model/catogary_page.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class CategoryPage extends GetView<AdsController> {
  final parameter;
  CategoryPage({this.parameter});
  // final AdsController c = Get.put(AdsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          parameter['title_navbar'],
          style: klabelAppbarStyle,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
      ),
      body: Obx(
        // init: controller.fetchCatogaryList(
        //     parameter['ad_catogary_id'], parameter['catogary_details_id']),
        () => controller.isLoadingCL.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.categoryList.isEmpty
                ? Center(child: Text('empty'.tr))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: controller.categoryList.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            controller.fdatadsbynamescrl(
                              parameter['ad_catogary_id'],
                              parameter['catogary_details_id'],
                              controller.categoryList[index].adDescriptionsId,
                            );
                            Get.to(
                              () => Ads(
                                title: parameter['title_navbar'],
                                title2: controller
                                    .categoryList[index].adDetailsDescription
                                    .toString(),
                              ),
                            );
                          },
                          child: containerCategory(
                            categ: controller.categoryList[index],
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }

  Widget containerCategory({CategoryModel? categ}) {
    // inspect(categ);
    return Container(
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
                child: Image.network(categ!.picture.toString(),
                    fit: BoxFit.cover, loadingBuilder: (BuildContext? ctx,
                        Widget? child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child!;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    );
                  }
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categ.adDetailsDescription.toString(),
                style: klabelStyleTitleCategory,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
