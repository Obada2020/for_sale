import 'package:flutter/material.dart';
import 'package:for_sale/Ads-details/view.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';

class Ads extends StatefulWidget {
  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  int selectindex = 0;
  TextEditingController serc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbodyColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.125),
        child: AppBar(
          leading: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                'سيارات BMW',
                style: klabelAppbarStyle,
              ),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: BoxDecoration(gradient: kGColor),
              ),
              Container(
                margin:
                    EdgeInsets.only(right: 15, left: 15, bottom: 12, top: 95),
                padding: EdgeInsets.only(right: 15, left: 15),
                width: size.width,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffF2F2F2),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: " ابحث عن  سيارات",
                    hintStyle: TextStyle(
                        fontFamily: 'FairuzBlack',
                        fontSize: 14,
                        color: Color(0xFF333333)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          //================================list horisental=========================
          Positioned(
            child: Container(
              width: size.width,
              height: size.height * 0.083,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext ctx, int index) {
                  return RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        selectindex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(13, 10, 13, 14),
                      padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff333333)),
                          gradient: selectindex == index
                              ? kGColor
                              : LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffF2F2F2),
                                    Color(0xffF2F2F2),
                                  ],
                                ),
                          color: Color(0xffF2F2F2),
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        'data data',
                        style: selectindex == index
                            ? klabelStyleBold11light
                            : klabelStyleBold11dark,
                      ),
                    ),
                  );
                },
                itemCount: 20,
              ),
            ),
          ),
          //================================grid view==========================

          Container(
            margin:
                EdgeInsets.only(top: size.height * 0.083, right: 16, left: 16),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 8,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(Adsdetails());
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          //----------card grid-----------
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.125,
                                width: 180,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      topLeft: Radius.circular(4),
                                    ),
                                    child: Image.asset(
                                      'img/image.jpg',
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                              top: 3,
                            ),
                            child: Text(
                              'سيارة Bmw اخت الجديدة مطلية ذهب',
                              style: klabelStyleBold12,
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
                                      borderRadius: BorderRadius.circular(4),
                                      gradient: kGColor),
                                  child: Text(
                                    '500  د.ك ',
                                    style: klabelStyleBold11light,
                                  )),
                              Text(
                                'قبل 2 يوم و 4 ساعة',
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
                  );
                }),
          ),
        ],
      ),
    );
  }
}
