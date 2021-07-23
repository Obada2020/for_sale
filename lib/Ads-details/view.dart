import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view-model.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Adsdetails extends StatefulWidget {
  @override
  _AdsdetailsState createState() => _AdsdetailsState();
}

class _AdsdetailsState extends State<Adsdetails> {
  List imgList = [
    'img/image.jpg',
    'img/image2.jpg',
    'img/image3.jpg',
  ];

  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final AdsController adctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // IconData icon = Icons.favorite_border;
    return Scaffold(
      backgroundColor: kbodyColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconFav(),
          ),
        ],
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'عرض الإعلان',
              style: klabelAppbarStyle,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          adDetail(size),
          specifications(),
          description(),
          social(),
          sggestedAds(),
        ],
      ),
    );
  }

  calling() async {
    var url = 'tel:+963${adctrl.ads[Get.arguments].adPhoneNumber}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  whatsapp() async {
    var url =
        "whatsapp://send?phone=+963${adctrl.ads[Get.arguments].adPhoneNumber}";
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
                      Share.share(
                          '${adctrl.ads[Get.arguments].adDescription}\n\n http://hyperurl.co/4buy');
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

  Widget adDetail(Size size) {
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
                        _current = index;
                      });
                    },
                    // height: size.height * 0.33333,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    viewportFraction: 1),
                items: imgList
                    .map((e) => ClipRRect(
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.asset(
                                e,
                                width: size.width,
                                height: 450,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
              Positioned(
                bottom: 1,
                right: size.width * 0.42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color(0xff4D5977)
                            : Colors.white,
                      ),
                    );
                  }),
                ),
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
                    '${adctrl.ads[Get.arguments].adDescription}',
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
                        '${adctrl.ads[Get.arguments].adPrice}',
                        style: klabelStyleBold11light,
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
                      '${adctrl.ads[Get.arguments].createdAt}',
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
              '${adctrl.ads[Get.arguments].adDescription}',
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
                      itemCount: 8,
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
                          margin: EdgeInsets.only(right: 9, left: 9),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              //----------card grid-----------
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 9),
                                    decoration: BoxDecoration(
                                      color: kbodyColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    width: 180,
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Text(
                                            'تاريخ الانتاج\t\t\t\t\t\t\t\t 2017 '),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
    return Container(
      margin: EdgeInsets.only(bottom: 14, top: 14),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16, top: 13),
            child: Text(
              'إعلانات مقترحة',
              style: klabelStyleBlack16,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 14, right: 16),
            height: 200,
            child: GetX<AdsController>(
              init: AdsController(),
              builder: (controller) {
                if (controller.ads != null) {
                  return GridView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.ads.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1,
                        crossAxisSpacing: 9,
                        mainAxisSpacing: 9,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print('object');
                            Get.back();
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
                              color: controller.ads[index].adTypeId == '2'
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
                                    controller.ads[index].adname!,
                                    style: klabelStyleBold12card,
                                    maxLines: 1,
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
          ),
        ],
      ),
    );
  }
}

class IconFav extends StatefulWidget {
  @override
  _IconFavState createState() => _IconFavState();
}

class _IconFavState extends State<IconFav> {
  IconData icon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return GetX<AddFavController>(
        init: AddFavController(),
        builder: (ctrl) {
          return GestureDetector(
            onTap: () {
              setState(() {
                ctrl.fdata();
                ctrl.result == "true"
                    ? icon = Icons.face_retouching_natural_rounded
                    : icon = Icons.favorite_border;
              });
            },
            child: Icon(icon),
            //  Icon(icon),
          );
        });
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$text',
              style: TextStyle(
                  fontFamily: 'FairuzBold', fontSize: 16, color: colortext),
            ),
            SizedBox(
              width: 10,
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
