import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  width: double.infinity,
                  height: 96,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'أنت مسجل معنا برقم هاتف : ',
                                  style: klabelStyleBold12,
                                ),
                                Text(
                                  '0592036504',
                                  style: klabelStyleBold12,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'تسجيل الخروج',
                                      style: klabelStyleBold12,
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  width: double.infinity,
                  height: 48,
                  child: Row(
                    children: [
                      Text('إعلاناتي المفضلة'),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  width: double.infinity,
                  height: 48,
                  child: Row(
                    children: [
                      Text('إعلاناتي'),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  width: double.infinity,
                  height: 48,
                  child: Row(
                    children: [
                      Text('المراسلة المباشرة مع الإدارة'),
                    ],
                  )),
            ],
          ),
        ));
  }
}
