import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:for_sale/Chat-WithAdmin/view.dart';
import 'package:for_sale/Favorite-ads/view.dart';
import 'package:for_sale/My-ads/view.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:for_sale/Sign-in/view.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class MyAccount extends StatelessWidget {
  //
  // String? obada = "";
  //
  var c = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: kGColor),
          ),
          title: Center(
            child: Text(
              'MyAccount_Appbar'.tr,
              style: klabelAppbarStyle,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4)),
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    // height: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => AutoSizeText(
                              'MyAccount_Label1'.tr +
                                  // c.user.value.info!.accountPhoneNumber
                                  c.number.value.toString()
                              // +"GGGG"
                              ,
                              style: klabelStyleBold14,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('تسجيل الخروج'),
                                            content: Text(
                                                "هل انت متأكد من تسجيل الخروج ؟"),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: Text("YES"),
                                                onPressed: () {
                                                  c.deletePreferences();
                                                  Get.reset();
                                                  Get.offAll(() => Signin());
                                                },
                                              ),
                                              ElevatedButton(
                                                child: Text("NO"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.logout),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'MyAccount_Label2'.tr,
                                        style: klabelStyleBold14.copyWith(
                                            color: Colors.red),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4)),
                    width: double.infinity,
                    height: 48,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => FavoriteAds());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          children: [
                            Icon(Icons.favorite),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'MyAccount_Label3'.tr,
                              style: klabelStyleBold14,
                            )
                          ],
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4)),
                    width: double.infinity,
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.to(() => MyAds());
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.list),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'MyAccount_Label4'.tr,
                                    style: klabelStyleBold14,
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4)),
                    width: double.infinity,
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: InkWell(
                          onTap: () {
                            Get.to(ChatUI());
                          },
                          child: Row(
                            children: [
                              Icon(Icons.people_alt),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'MyAccount_Label5'.tr,
                                style: klabelStyleBold14,
                              ),
                            ],
                          )),
                    )),
              ],
            ),
          ),
        ));
  }
}
