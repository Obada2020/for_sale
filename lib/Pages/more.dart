import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        title: Center(
          child: Text(
            'المزيد',
            style: klabelAppbarStyle,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(right: 17),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4)),
                width: double.infinity,
                height: 48,
                child: Row(
                  children: [
                    Icon(
                      Icons.view_list_sharp,
                      //color: Color(0xFF405A76),
                      size: 27,
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'الشروط والأحكام',
                      style: klabelStyleBold12,
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.only(right: 17),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4)),
                width: double.infinity,
                height: 48,
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      //color: Color(0xFF405A76),
                      size: 27,
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'الإعدادات',
                      style: klabelStyleBold12,
                    ),
                  ],
                )),
            Container(
              height: size.height - (size.height * 0.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'تواصل معنا',
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
