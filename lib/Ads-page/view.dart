import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class Ads extends GetView<AdsController> {
  //
  final String? title;
  //
  final String? title2;
  //
  Ads({this.title, this.title2});
  //
  // final AdsController controller = Get.find<AdsController>();
  //
  final TextEditingController serc = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // backgroundColor: Get.theme.primaryColor,
      //
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title != null ? title.toString() + " " + title2.toString() : '',
          style: Get.textTheme.headline1!,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // decoration: BoxDecoration(gradient: kGColor),
              color: kGColor.colors.first,
              child: serch(),
              padding: EdgeInsets.all(14),
            ),
            Obx(
              () => controller.adsLoading.value
                  ? CircularProgressIndicator()
                  : Column(
                      children: [choose(), gridview()],
                    ),
            ),
            // choose(), gridview(),
          ],
        ),
      ),
    );
  }

  //================================ choose ==========================
  Widget choose() {
    return Container(
      width: Get.width,
      height: 60,
      // color: Get.theme.primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext ctx, int index) {
          return RawMaterialButton(
            onPressed: () {
              controller.selectIndex.value = index;
              controller.filterads(controller.scrl[index].toString());
            },
            child: Obx(
              () => Container(
                margin: EdgeInsets.fromLTRB(13, 10, 13, 14),
                padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff333333)),
                    gradient: controller.selectIndex.value == index
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
                alignment: Alignment.center,
                child: Text("${controller.scrl[index]}",
                    style:
                        // controller.selectIndex.value == index

                        TextStyle(fontSize: 10, color: Colors.black)
                    // : Get.textTheme.headline1!.copyWith(fontSize: 10),
                    ),
              ),
            ),
          );
        },
        itemCount: controller.scrl.length,
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
        // color: Get.theme.primaryColor,
        color: Color(0xffF2F2F2),
      ),
      child: TextField(
        onChanged: (txt) {
          controller.fileserch(txt); // ADS Search ??
          // controller.fileserchHome(txt);
        },
        style: Get.theme.textTheme.bodyText1,
        decoration: InputDecoration(
          hintText: title != null
              ? " ${'search2'.tr}   ${title2!.toString()}"
              : 'search',
          hintStyle: Get.theme.textTheme.bodyText1,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  //================================grid view=========================
  Widget gridview() {
    return Container(
      // color: Get.theme.primaryColor,
      child: Obx(
        () => Container(
          child: controller.fullads.isEmpty
              ? Text(
                  "empty".tr,
                  style: Get.theme.textTheme.bodyText1,
                )
              : GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.fullads.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 9,
                    mainAxisSpacing: 9,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => Adsdetails(
                            temp: controller.fullads[index],
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
                          color: controller.fullads[index].isSpecial == 1
                              ? Color(0xFFCED8DC)
                              : Get.theme.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                controller.fullads[index].adpicture![0]
                                        .adPicture ??
                                    "",
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Center(
                                    child: Text('Empty',
                                        style: Get.theme.textTheme.bodyText1),
                                  );
                                },
                                //
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
                                          Colors.green,
                                        ),
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
                                controller.fullads[index].adName!,
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
                                        borderRadius: BorderRadius.circular(4),
                                        gradient: kGColor),
                                    child: Text(
                                      controller.fullads[index].adPrice
                                          .toString(),
                                      style: Get.textTheme.bodyText1!,
                                    )),
                                Text(
                                  ('قبل : ${(DateTime.now().difference(DateTime(
                                        int.parse(controller
                                            .fullads[index].createdAt!
                                            .substring(0, 4)),
                                        int.parse(controller
                                            .fullads[index].createdAt!
                                            .substring(5, 7)),
                                        int.parse(controller
                                            .fullads[index].createdAt!
                                            .substring(8, 10)),
                                        int.parse(controller
                                            .fullads[index].createdAt!
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
                  },
                ),
        ),
      ),
    );
  }

  //==================================================================
}
