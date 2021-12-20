import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/Chat-WithAdmin/view.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:for_sale/Model/home.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:for_sale/Sign-in/view.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Adsdetails extends GetView<HomeController> {
  //
  // String? x;
  //
  final Ads? temp;
  //
  Adsdetails({this.temp});
  //
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
      //backgroundColor: kbodyColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: kGColor,
          ),
        ),
        actions: [
          Obx(() => Get.find<UserController>().accountId.value.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () async {
                      Get.defaultDialog(
                        title: "",
                        titlePadding: EdgeInsets.all(0),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Loading...",
                                style: Get.theme.textTheme.bodyText1!),
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                      c.result.value = await c.addFavorite(temp!.adId);
                      Get.back();
                      if (c.result.value) {
                        Get.defaultDialog(
                          title: "",
                          titlePadding: EdgeInsets.all(0),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("تمت إضافته للمفضلة",
                                  style: Get.theme.textTheme.bodyText1!),
                              Icon(Icons.check)
                            ],
                          ),
                        );
                        await Future.delayed(Duration(seconds: 1));
                        Get.back();
                      } else {
                        Get.defaultDialog(
                          title: "",
                          titlePadding: EdgeInsets.all(0),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("تمت إزالته من المفضلة",
                                  style: Get.theme.textTheme.bodyText1!),
                              Icon(Icons.dangerous_outlined)
                            ],
                          ),
                        );
                        await Future.delayed(Duration(seconds: 1));
                        Get.back();
                      }

                      // print('view ${c.result.value}');
                    },
                    child: Obx(() => Icon(
                        c.result.value ? Icons.check : Icons.favorite_border)),
                    //  Icon(icon),
                  ),
                ))
        ],
        centerTitle: true,
        title: Text(
          'عرض الإعلان',
          style: Get.textTheme.headline1!,
        ),
      ),
      body: ListView(
        children: [
          Details(
            temp: temp,
          ),
          temp!.adInfo?.isNotEmpty ?? true ? specifications() : Container(),
          description(),
          social(),
          sggestedAds(),
        ],
      ),
    );
  }

  calling() async {
    var url = 'tel:${temp!.adPhoneNumber}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  whatsapp() async {
    var url = "https://wa.me/${temp!.adPhoneNumber}/?text=${temp!.adName}";
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
                    ontap: () {
                      if (Get.find<UserController>().token.isNotEmpty) {
                        Get.to(ChatUI());
                        return;
                      }
                      Get.to(Signin());
                    },
                  ),
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
                          '${temp!.adDescription}\n https://www.forsaleq8.com/');
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
            Text('الوصف', style: Get.textTheme.bodyText1!),
            Text(
              temp!.adDescription!,
              style: TextStyle(
                fontFamily: 'FairuzBlack',
                fontSize: 12,
                color: Theme.of(Get.context!).primaryColor == Colors.black
                    ? Colors.white
                    : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

//===========================مواصفات======================
  Widget specifications() {
    // List t = jsonDecode(temp!.adInfo!); // ERROR
    // String s = temp!.adInfo!.substring(0, temp!.adInfo!.length);
    // String s = "";
    // s = s.substring(1, s.length - 1);

    // // .substring(1, temp!.adInfo!.length - 1);
    // // print(s);
    // var x = s.split(",");
    // // x = x.map((element) => element.substring(1, element.length - 1)).toList();
    var keys = [];
    var values = [];
    temp!.adInfo![0].forEach((key, value) {
      keys.add(key);
      values.add(value);
    });
    // // //
    // x.forEach(
    //   (e) {
    //     var v = e.split(":");
    //     // print(e);
    //     values.add(v[1].replaceAll('\'', ' ').trim());
    //     keys.add(v[0].replaceAll('\'', ' ').trim());
    //     // // keys.add(e.substring(1, e.length - 1).split(":")[0]);
    //   },
    // );
    // //
    // // x.forEach((element) {
    // //   print(element);
    // // });
    // //
    // // print("object");
    // //
    // keys.forEach((element) {
    //   print(element);
    // });

    // // print("object");

    // values.forEach((element) {
    //   print(element);
    // });
    //
    // var r = jsonDecode(temp!.adInfo.toString());
    // print(temp!.adInfo);
    // print(temp!.adInfo);
    //
    //
    // var r = temp!.adInfo![0][1];
    // print(r);
    // temp!.adInfo!.forEach((element) {
    //   element.forEach((key, value) {
    //     print(key + " == > " + value);
    //   });
    // });
    //
    //
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
                style: Get.textTheme.bodyText1!,
              ),
              children: [
                Container(
                  color: Theme.of(Get.context!).primaryColor,
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
                            // color: kbodyColor,
                            border: Border.all(
                                color: Theme.of(Get.context!).accentColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          // width: 180,
                          alignment: Alignment.center,
                          // height: 40,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    keys[index] + "  :  ",
                                    style: Get.textTheme.bodyText1!,
                                  ),
                                  Text(
                                    values[index],
                                    style: Get.textTheme.bodyText1!,
                                  ),
                                ],
                              ),
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
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ads_details_suggest'.tr, style: Get.textTheme.bodyText1!),
          list!.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 200, // <-- you should put some value here
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            width: 15,
                          ),
                          scrollDirection: Axis.horizontal,
                          // shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return containerOffer(
                              context,
                              image: list[index].adpicture![0].adPicture,
                              disc: list[index].adName,
                              price: list[index].adPrice,
                              time: list[index].createdAt,
                              indexA: index,
                              indexC: list[index].adCatogaryId,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Container(
                    child: Text("Ads_details_No_suggest".tr),
                  ),
                ),
        ],
      ),
    );
  }

  Widget containerOffer(context,
      {disc, price, String? time, image, indexC, indexA}) {
    // var list = controller.homeList
    //     .where((s) => s.adCatogaryId == temp!.adCatogaryId)
    //     .first
    //     .ads;
    return InkWell(
      onTap: () {
        // print("Obadaaaaaaaaaaaaaaaaa");
        var list = controller.homeList
            .where((s) => s.adCatogaryId == temp!.adCatogaryId)
            .first
            .ads;
        Get.back();
        Get.to(
          () => Adsdetails(
            temp: list![indexA],
          ),
        );
      },
      child: Container(
        width: 210,
        height: 218,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).primaryColor == Colors.black
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

                image,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Center(
                    child: Text('Empty', style: Get.theme.textTheme.bodyText1),
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
                    style: Get.textTheme.bodyText1!,
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
                            style: Get.textTheme.bodyText1!,
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
      decoration: BoxDecoration(color: Theme.of(Get.context!).primaryColor),
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
                      (e) => InkWell(
                        onTap: () {
                          Get.dialog(
                            Container(
                              width: Get.width - 100,
                              height: Get.height - 100,
                              child: Image.network(
                                e.adPicture ?? "",
                                // "https://www.wallpapertip.com/wmimgs/167-1679333_asus-rog-wallpaper-4k-asus-rog-gaming-4k.jpg",
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Center(
                                    child: Text(
                                      'Empty',
                                      style: Get.theme.textTheme.bodyText1,
                                    ),
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
                                // width: Get.width,
                                // height: 450,
                                // fit: BoxFit.cover,
                              ),
                            ),
                            barrierDismissible: false,
                            useSafeArea: false,
                          );
                        },
                        child: ClipRRect(
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.network(
                                e.adPicture ?? "",
                                // "https://www.wallpapertip.com/wmimgs/167-1679333_asus-rog-wallpaper-4k-asus-rog-gaming-4k.jpg",
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
                                width: Get.width,
                                height: 450,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
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
                    style: Get.textTheme.bodyText1!,
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
                        style: Get.textTheme.bodyText1!
                            .copyWith(fontWeight: FontWeight.bold),
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
