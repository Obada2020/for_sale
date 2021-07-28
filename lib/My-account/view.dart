import 'package:flutter/material.dart';
import 'package:for_sale/My-account/view-model.dart';
import 'package:for_sale/Sign-in/Signin_view.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccount extends StatelessWidget {
  String? obada = "";
  var c = Get.put(MyAccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: kGColor),
          ),
          title: Center(
            child: Text(
              'حسابي',
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
                    height: 96,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 17),
                                child: Row(
                                  children: [
                                    Text(
                                      'أنت مسجل معنا برقم هاتف   :   ',
                                      style: klabelStyleBold14,
                                    ),
                                    Obx(
                                      () => Text(
                                        c.number.toString(),
                                        style: klabelStyleBold14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        c.deleteNumber();
                                        Get.offAll(() => Signin());
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.logout),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'تسجيل الخروج',
                                            style: klabelStyleBold14.copyWith(
                                                color: Colors.red),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4)),
                    width: double.infinity,
                    height: 48,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          children: [
                            Icon(Icons.favorite),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'إعلاناتي المفضلة',
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
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.list),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'إعلاناتي',
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
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(Icons.people_alt),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'المراسلة المباشرة مع الإدارة',
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
