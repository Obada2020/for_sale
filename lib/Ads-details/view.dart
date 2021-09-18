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
    // print(widget.details);
    // IconData icon = Icons.favorite_border;
    temp!.adpicture!.forEach((element) {
      print(element.adPicture);
    });
    print("GG");
    return Scaffold(
      //backgroundColor: kbodyColor,
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
            currentIndex: _current,
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
      color: Theme.of(Get.context!).primaryColor,
      margin: EdgeInsets.only(bottom: 14, top: 14),
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
      color: Theme.of(Get.context!).primaryColor,
      // height: size.height * 0.34196,
      child: Container(
        padding: EdgeInsets.only(right: 16, bottom: 69, left: 16),
        margin: EdgeInsets.only(right: 16, top: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الوصف',
              style: klabelStyleBlack16.copyWith(
                  color: Theme.of(Get.context!).primaryColor == Colors.black
                      ? Colors.white
                      : Colors.black),
            ),
            Text(
              temp!.adDescription!,
              style: TextStyle(
                  fontFamily: 'FairuzBlack',
                  fontSize: 12,
                  color: Theme.of(Get.context!).primaryColor == Colors.black
                      ? Colors.white
                      : Colors.grey.shade700),
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
            color: Theme.of(Get.context!).primaryColor,
            child: ExpansionTile(
              title: Text(
                'المواصفات',
                style: klabelStyleBlack16.copyWith(
                    color: Theme.of(Get.context!).primaryColor == Colors.black
                        ? Colors.white
                        : Colors.black),
              ),
              children: [
                Container(
                  color: Theme.of(Get.context!).primaryColor,
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
                            color: Theme.of(Get.context!).primaryColor,
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
                                          'تاريخ الانتاج\t\t\t\t\t\t\t\t 2017 ',
                                          style: TextStyle(color: Colors.black),
                                        ),
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
      color: Theme.of(Get.context!).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16, top: 13),
            child: Text(
              'إعلانات مقترحة',
              style: klabelStyleBlack16.copyWith(
                  color: Theme.of(Get.context!).primaryColor == Colors.black
                      ? Colors.white
                      : Colors.black),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 14, right: 16),
          //   height: 200,
          //   child: GetX<HomeController>(
          //     builder: (controller) {
          //       if (controller.homeList.isNotEmpty) {
          //         return GridView.builder(
          //             scrollDirection: Axis.horizontal,
          //             shrinkWrap: true,
          //             itemCount: controller
          //                         .homeList[temp!.adCatogaryId!].ads!.length <
          //                     8
          //                 ? controller.homeList[temp!.adCatogaryId!].ads!.length
          //                 : 8,
          //             gridDelegate:
          //                 new SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: 1,
          //               childAspectRatio: 1,
          //               crossAxisSpacing: 9,
          //               mainAxisSpacing: 9,
          //             ),
          //             itemBuilder: (context, index) {
          //               return InkWell(
          //                 // onTap: () {
          //                 //   Get.back();
          //                 //   Map details = {
          //                 //   //   'adId': widget.c.ads[index].adId,
          //                 //   //   'accountId': widget.c.ads[index].accountId,
          //                 //   //   'adName': widget.c.ads[index].adName,
          //                 //   //   'adphone': widget.c.ads[index].adPhoneNumber,
          //                 //   //   'addescr': widget.c.ads[index].adDescription,
          //                 //   //   'adpicture': widget.c.ads[index].adPicture,
          //                 //   //   'adprice': widget.c.ads[index].adPrice,
          //                 //   //   'adinfo': widget.c.ads[index].adInfo,
          //                 //   //   'created': widget.c.ads[index].createdAt,
          //                 //   //   'updated': widget.c.ads[index].updatedAt,
          //                 //   // };
          //                 //   // Get.to(() => Adsdetails(
          //                 //   //       details: details,
          //                 //   //     ));
          //                 // },
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                     boxShadow: [
          //                       BoxShadow(
          //                         spreadRadius: 1,
          //                         blurRadius: 5,
          //                         color: Colors.grey.withOpacity(0.2),
          //                       )
          //                     ],
          //                     // color: controller.ads[index].adTypeId == '2'
          //                     //     ? Color(0x79667590)
          //                     //     : Colors.white,
          //                     borderRadius: BorderRadius.circular(4),
          //                   ),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       //----------card grid-----------
          //                       Container(
          //                         child: ClipRRect(
          //                             borderRadius: BorderRadius.only(
          //                               topRight: Radius.circular(4),
          //                               topLeft: Radius.circular(4),
          //                             ),
          //                             child: Image.network(
          //                               controller.homeList[temp!.adCatogaryId!].ads![index].adpicture![0].adPicture.toString(),
          //                               fit: BoxFit.cover,
          //                               loadingBuilder: (BuildContext? ctx,
          //                                   Widget? child,
          //                                   ImageChunkEvent? loadingProgress) {
          //                                 if (loadingProgress == null) {
          //                                   return child!;
          //                                 } else {
          //                                   return Center(
          //                                     child: CircularProgressIndicator(
          //                                       valueColor:
          //                                           AlwaysStoppedAnimation<
          //                                               Color>(Colors.green),
          //                                     ),
          //                                   );
          //                                 }
          //                               },
          //                             )),
          //                       ),

          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           left: 5,
          //                           right: 7,
          //                           top: 3,
          //                         ),
          //                         child: Text(
          //                           controller.homeList[temp!.adCatogaryId!].ads![index].adName!,
          //                           style: klabelStyleBold12card,
          //                           maxLines: 1,
          //                         ),
          //                       ),
          //                       Row(
          //                         children: [
          //                           Container(
          //                               margin: EdgeInsets.only(
          //                                   right: 5, bottom: 5, left: 10),
          //                               padding: EdgeInsets.only(
          //                                 left: 5,
          //                                 right: 6,
          //                                 top: 3,
          //                                 bottom: 4,
          //                               ),
          //                               decoration: BoxDecoration(
          //                                   borderRadius:
          //                                       BorderRadius.circular(4),
          //                                   gradient: kGColor),
          //                               child: Text(
          //                                 controller.homeList[temp!.adCatogaryId!].ads![index].adPrice
          //                                     .toString(),
          //                                 style: klabelStyleBold11light,
          //                               )),
          //                           Text(
          //                             ('قبل : ${(DateTime.now().difference(DateTime(
          //                                   int.parse(controller.homeList[temp!.adCatogaryId!].ads![index].createdAt!
          //                                       .substring(0, 4)),
          //                                   int.parse(controller.homeList[temp!.adCatogaryId!].ads![index].createdAt!
          //                                       .substring(5, 7)),
          //                                   int.parse(controller.homeList[temp!.adCatogaryId!].ads![index].createdAt!
          //                                       .substring(8, 10)),
          //                                   int.parse(controller.homeList[temp!.adCatogaryId!].ads![index].createdAt!
          //                                       .substring(11, 13)),
          //                                 )).inDays)}  يوم  '),
          //                             maxLines: 2,
          //                             style: TextStyle(
          //                                 fontFamily: 'FairuzBold',
          //                                 fontSize: 10,
          //                                 color: Color(0xFF5E5E5E)),
          //                           ),
          //                           // Text(controller.ads[index].createdAt!
          //                           //     .substring(11, 13))
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             });
          //       } else {
          //         return Center(
          //             child: Container(
          //           child: CircularProgressIndicator(),
          //         ));
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Details extends StatefulWidget {
  Details({this.temp, this.currentIndex});
  Ads? temp;
  int? currentIndex;
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(Get.context!).primaryColor),
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, _) {
                    setState(() {
                      widget.currentIndex = index;
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
                    style: klabelStyleBold12card.copyWith(
                        color:
                            Theme.of(Get.context!).primaryColor == Colors.black
                                ? Colors.white
                                : Colors.black),
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
                      widget.temp!.createdAt!,
                      style: TextStyle(
                          fontFamily: 'FairuzBold',
                          fontSize: 10,
                          color: Theme.of(Get.context!).primaryColor ==
                                  Colors.black
                              ? Colors.white
                              : Colors.grey.shade700),
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
