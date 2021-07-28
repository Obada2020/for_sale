import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              height: MediaQuery.of(context).size.height - 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                child: Image.asset(
                                  'img/face.png',
                                  scale: 12,
                                ),
                                onTap: () {
                                  facebook();
                                },
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                child: Image.asset(
                                  'img/insta.png',
                                  scale: 12,
                                ),
                                onTap: () {
                                  insta();
                                },
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                child: Image.asset(
                                  'img/snap.png',
                                  scale: 12,
                                ),
                                onTap: () {
                                  snap();
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

  facebook() async {
    var url = "https://www.facebook.com/profile.php?id=100010221011270";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  insta() async {
    var url = "https://www.instagram.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  snap() async {
    var url = "https://www.snapchat.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
