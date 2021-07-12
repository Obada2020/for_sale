import 'package:flutter/material.dart';
import 'package:for_sale/Category-page/view.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

//لك احلا حيى بالكرة
class _HomeState extends State<Home> {
  // HomeController homeController = Get.put(HomeController());

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
                builder: (ctrl) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: ctrl.homeList.value.length,
                      itemBuilder: (context, indexF) {
                        return Column(
                          children: [
                            //title
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 16, end: 16, top: 20),
                              child: containerTitle(ctrl
                                  .homeList.value[indexF].adCatogaryName
                                  .toString()),
                            ),
                            //category
                            Container(
                              height: 140,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, indexL) =>
                                    containerCategory(
                                        name: ctrl
                                            .homeList
                                            .value[indexF]
                                            .catogaryDetails![indexL]
                                            .catogaryName!
                                            .toString()),
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 5),
                                itemCount: ctrl.homeList.value[indexF]
                                    .catogaryDetails!.length,
                              ),
                            ),
                            //offer
                            Container(
                              height: 270.0,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    containerOffer(context, size),
                                itemCount: 5,
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 12),
                              ),
                            )
                          ],
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }

  Widget containerTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: klabelStyleTitle),
        Row(
          children: [
            Text("عرض الكل", style: klabelStyleShowAll),
            Icon(Icons.chevron_right_sharp, color: Colors.blue, size: 15),
          ],
        ),
      ],
    );
  }

  Widget containerCategory({String? name}) {
    //pictre value
    return TextButton(
      child: Container(
        height: 140.0,
        width: 110.0,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 20, end: 20, top: 15.1),
          child: Center(
            child: Column(
              children: [
                Image.asset("img/5321.jpg"),
                SizedBox(height: 11.2),
                Text(
                  name!,
                  style: klabelStyleTitleCategory,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
        ),
      ),
      onPressed: () {
        Get.to(CategoryPage());
      },
    );
  }

  Widget containerOffer(context, size) {
    return Container(
      width: 210,
      height: 218,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          //image
          Image.asset(
            "img/country house.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //title
                Text(
                  "هذا النص هو نص تجريبي من مولد النص العربي",
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
                          '500  د.ك ',
                          style: klabelStyleBold11light,
                        )),
                    Text(
                      'قبل 2 يوم و 4 ساعة',
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
