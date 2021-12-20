import 'package:flutter/material.dart';
import 'package:for_sale/Pages/privacy_and_terms.dart';
import 'package:for_sale/Pages/setting.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => PrivacyAndTerms());
            },
            child: Container(
                padding: EdgeInsets.only(right: 17, left: 17),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(Get.context!).brightness ==
                                  Brightness.dark
                              ? Colors.transparent
                              : Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(2, 2))
                    ],
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4)),
                width: double.infinity,
                height: 48,
                child: Row(
                  children: [
                    Icon(
                      Icons.view_list_sharp,
                      size: 27,
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'More_Label1'.tr,
                      style: Get.textTheme.bodyText1!,
                    ),
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              Get.to(() => Settings());
            },
            child: Container(
                padding: EdgeInsets.only(right: 17, left: 17),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(Get.context!).brightness ==
                                  Brightness.dark
                              ? Colors.transparent
                              : Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(2, 2))
                    ],
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4)),
                width: double.infinity,
                height: 48,
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 27,
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'More_Label2'.tr,
                      style: Get.textTheme.bodyText1!,
                    ),
                  ],
                )),
          ),
          Expanded(child: Container()),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'More_Label3'.tr,
                  style: Get.theme.textTheme.bodyText1,
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  // margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(Get.context!).brightness ==
                                    Brightness.dark
                                ? Colors.transparent
                                : Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(2, 2))
                      ],
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4)),
                  width: double.infinity,
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: new ExactAssetImage(
                                  'img/twitter.png',
                                ),
                                fit: BoxFit.contain,
                              ))),
                          onTap: () {
                            twitter();
                          },
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: new ExactAssetImage(
                                  'img/insta.png',
                                ),
                                fit: BoxFit.contain,
                              ))),
                          onTap: () {
                            insta();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  twitter() async {
    var url = "https://twitter.com/forsaleq8com/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  insta() async {
    var url = "https://www.instagram.com/forsaleq8com/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
