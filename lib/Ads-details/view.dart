import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:for_sale/Model/home.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Adsdetails extends GetView<HomeController> {
  final Ads? temp;
  Adsdetails({this.temp});

  final int _current = 0;
  //
  final AdsController c = Get.put(AdsController());
  //
  @override
  Widget build(BuildContext context) {
    temp!.adpicture!.forEach((element) {
      print(element.adPicture);
    });
    print("GG");
    return Scaffold(
      // backgroundColor: kbodyColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
                onTap: () async {
                  await c.addFavorite(temp!.adId);
                  print('view ${c.result.value}');
                },
                child: Obx(
                  () => c.result.value == true
                      ? Icon(Icons.check)
                      : Icon(Icons.favorite_border),
                )
                //  Icon(icon),
                ),
          )
        ],
        centerTitle: true,
        title: Text(
          'عرض الإعلان',
          style: klabelAppbarStyle,
        ),
      ),
      body: ListView(
        children: [
          Details(
            temp: temp,
          ),
          temp!.adInfo!.isNotEmpty ? specifications() : Container(),
          description(),
          social(),
          sggestedAds(),
        ],
      ),
    );
  }

  calling() async {
    var url = 'tel:+963${temp!.adPhoneNumber}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  whatsapp() async {
    var url = "whatsapp://send?phone=+963${temp!.adPhoneNumber}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget social() {
    return Container(
      margin: EdgeInsets.only(bottom: 14, top: 14),
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(right: 16, top: 15, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SocialCard(
                    lg: kGColor,
                    text: 'إتصال بالبائع',
                    colortext: Colors.white,
                    icon: Icons.phone,
                    coloricon: Colors.white,
                    ontap: () {
                      calling();
                    },
                  ),
                ),
                Expanded(
                  child: SocialCard(
                    colortext: Colors.white,
                    color: Color(0xff25D366),
                    text: 'WhatsApp',
                    icon: Icons.phone_android_rounded,
                    coloricon: Colors.white,
                    ontap: () {
                      whatsapp();
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SocialCard(
                      colortext: Colors.white,
                      color: Color(0xff333333),
                      text: 'إبلاغ عن مشكلة',
                      icon: Icons.report_gmailerrorred,
                      coloricon: Colors.white,
                      ontap: null),
                ),
                Expanded(
                  child: SocialCard(
                    color: Color(0xffF2F2F2),
                    colortext: Colors.black,
                    text: 'مشاركة الإعلان',
                    icon: Icons.share,
                    coloricon: Colors.black,
                    border: Border.all(color: Color(0xff333333)),
                    ontap: () {
                      // Share.share(
                      //     '${widget.details['addescr']}\n\n http://hyperurl.co/4buy');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//==========================وصف===========================
  Widget description() {
    return Container(
      margin: EdgeInsets.only(bottom: 14, top: 14),
      color: Colors.white,
      // height: size.height * 0.34196,
      child: Container(
        padding: EdgeInsets.only(right: 16, bottom: 69, left: 16),
        margin: EdgeInsets.only(right: 16, top: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الوصف',
              style: klabelStyleBlack16,
            ),
            Text(
              temp!.adDescription!,
              style: TextStyle(
                  fontFamily: 'FairuzBlack', fontSize: 12, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

//===========================مواصفات======================
  Widget specifications() {
    // List t = jsonDecode(temp!.adInfo!);
    String s = temp!.adInfo!.substring(2, temp!.adInfo!.length - 2);
    // print(s);
    List<String> x = s.split(",");
    List<String> keys = [];
    List<String> values = [];

    x.forEach(
      (element) {
        values.add(element.split(":")[1]);
        keys.add(element.split(":")[0]);
      },
    );

    // List t = jsonDecode("[{"date": "1/1/2002","sale": 500, "fax": "fdfd","ss": "sasasa" }]");
    // t.forEach((element) {
    //   print(element);
    // });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 17, top: 19),
          child: Container(
            color: Colors.white,
            child: ExpansionTile(
              title: Text(
                'المواصفات',
                style: klabelStyleBlack16,
              ),
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 20),
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: keys.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 50,
                        mainAxisSpacing: 9,
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: 9,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   borderRadius: BorderRadius.circular(4),
                          // ),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.only(right: 9),
                          decoration: BoxDecoration(
                            color: kbodyColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          // width: 180,
                          // height: 40,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  keys[index].substring(
                                          1, keys[index].length - 1) +
                                      " : ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  values[index]
                                      .substring(2, values[index].length - 1),
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

//==========================مقترحة ===========================
  Widget sggestedAds() {
    //

    var list = controller.homeList
        .where((s) => s.adCatogaryId == temp!.adCatogaryId)
        .first
        .ads;
    return Container(
      // width: 200,
      // height: 140,
      margin: EdgeInsets.only(bottom: 14, top: 14),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // width: 200,
            // height: 200,
            margin: EdgeInsets.only(right: 16, top: 13),
            child: Text(
              'إعلانات مقترحة',
              style: klabelStyleBlack16,
            ),
          ),
          list!.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return containerOffer(context,
                        image: list[index].adpicture![0].adPicture,
                        disc: list[index].adName,
                        price: list[index].adPrice,
                        time: list[index].createdAt);
                  })
              : Center(
                  child: Container(
                    child: Text("لايوجد اعلانات مقترحة"),
                  ),
                ),
        ],
      ),
    );
  }

  Widget containerOffer(context,
      {disc, price, String? time, image, indexC, indexA}) {
    var list = controller.homeList
        .where((s) => s.adCatogaryId == temp!.adCatogaryId)
        .first
        .ads;
    return InkWell(
      onTap: () {
        Get.to(
          () => Adsdetails(
              temp: controller
                  .adsHome![controller.homeList[indexC].adCatogaryId!][indexA]),
        );
      },
      child: Container(
        width: 210,
        height: 218,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.white,
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

                image,
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
                },
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

class Details extends StatefulWidget {
  Details({this.temp});
  Ads? temp;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, _) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  viewportFraction: 1,
                ),
                items: widget.temp!.adpicture!
                    .map(
                      (e) => ClipRRect(
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              e.adPicture!,
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
                              width: Get.width,
                              height: 450,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 12, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.temp!.adName!,
                    style: klabelStyleBold12card,
                    maxLines: 2,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5, bottom: 5, left: 10),
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
                        widget.temp!.adPrice.toString(),
                        style: klabelStyleBold11light.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(
                      Icons.timelapse_sharp,
                      size: 12,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'قبل : ${(DateTime.now().difference(
                            DateTime(
                              int.parse(
                                  widget.temp!.createdAt!.substring(0, 4)),
                              int.parse(
                                  widget.temp!.createdAt!.substring(5, 7)),
                              int.parse(
                                  widget.temp!.createdAt!.substring(8, 10)),
                              int.parse(
                                  widget.temp!.createdAt!.substring(11, 13)),
                            ),
                          ).inDays)}  يوم  ',
                      style: TextStyle(
                        fontFamily: 'FairuzBold',
                        fontSize: 10,
                        color: Color(
                          0xFF5E5E5E,
                        ),
                      ),
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

//==========================Card Call & Whatsapp =============
class SocialCard extends StatelessWidget {
  void Function()? ontap;
  String? text;
  Color? color;
  Color? colortext;
  Color? coloricon;
  IconData? icon;
  LinearGradient? lg;
  BoxBorder? border;
  SocialCard(
      {this.colortext,
      this.border,
      this.ontap,
      this.text,
      this.color,
      this.icon,
      this.lg,
      this.coloricon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10,
          left: 3.5,
        ),
        padding: EdgeInsets.only(right: 5, top: 12, bottom: 13),
        decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(4),
            color: color,
            gradient: lg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$text',
              style: TextStyle(
                  fontFamily: 'FairuzBold', fontSize: 16, color: colortext),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              icon,
              color: coloricon,
            ),
          ],
        ),
      ),
    );
  }
}
