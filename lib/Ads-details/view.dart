import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kbodyColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite_outline_rounded,
              color: Colors.white,
            ),
          ),
        ],
        // leading: IconButton(
        //   onPressed: null,
        //   icon: Icon(
        //     Icons.arrow_back_rounded,
        //     color: Colors.white,
        //   ),
        // ),
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
          Container(
            height: size.height * 0.446,
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
                          height: size.height * 0.33333,
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
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
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
                      Text('سيارة الماني BMW'),
                      Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(right: 5, bottom: 5, left: 10),
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
              ],
            ),
          ),
          //============================مواصفات======================
          Column(
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
                        height: size.height * 0.35,
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: 20,
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: size.height * 0.055555,
                              mainAxisSpacing: 9,
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 2,
                              crossAxisSpacing: 9,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
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
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          width: 180,
                                          height: size.height * 0.055555,
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
          ),
          Container(
            margin: EdgeInsets.only(bottom: 14, top: 14),
            color: Colors.white,
            height: size.height * 0.34196,
            child: Container(
              margin: EdgeInsets.only(right: 16, top: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الوصف',
                    style: klabelStyleBlack16,
                  ),
                  Text(
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى ',
                    style: TextStyle(
                        fontFamily: 'FairuzBlack',
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 14, top: 14),
            color: Colors.white,
            height: size.height * 0.1798,
            child: Container(
              margin: EdgeInsets.only(right: 16, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: null,
                        child: Container(
                          height: size.height * 0.0654,
                          width: size.width * 0.447,
                          margin: EdgeInsets.only(bottom: 7, left: 7),
                          padding: EdgeInsets.only(
                            right: 15,
                            top: 13,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: kGColor),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'اتصال بالبائع ',
                                style: TextStyle(
                                    fontFamily: 'FairuzBold',
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: null,
                        child: Container(
                          height: size.height * 0.0654,
                          width: size.width * 0.447,
                          margin: EdgeInsets.only(
                            right: 7,
                            bottom: 7,
                          ),
                          padding: EdgeInsets.only(
                            right: 15,
                            top: 13,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff25D366)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'WhatsApp',
                                style: TextStyle(
                                    fontFamily: 'FairuzBold',
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                Icons.phone_android_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: null,
                        child: Container(
                          height: size.height * 0.0654,
                          width: size.width * 0.447,
                          margin: EdgeInsets.only(bottom: 10, left: 7),
                          padding: EdgeInsets.only(
                            right: 15,
                            top: 13,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff333333)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'إبلاغ عن مشكلة',
                                style: TextStyle(
                                    fontFamily: 'FairuzBold',
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.report_gmailerrorred,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: null,
                        child: Container(
                          height: size.height * 0.0654,
                          width: size.width * 0.447,
                          margin: EdgeInsets.only(right: 7, bottom: 10),
                          padding: EdgeInsets.only(
                            right: 15,
                            top: 13,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff333333)),
                              color: Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'مشاركة الإعلان',
                                style: TextStyle(
                                    fontFamily: 'FairuzBold',
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 14, top: 14),
            color: Colors.white,
            height: size.height * 0.35,
            // height: size.height * 0.,

            child:
                // Container(
                //   margin: EdgeInsets.only(right: 16, top: 13),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                // Text(
                //   'إعلانات مقترحة',
                //   style: klabelStyleBlack16,
                // ),
                Column(
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
                  height: size.height * 0.268,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: 9,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: null,
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
                            child:
                                //  Container(
                                //   color: Colors.red,
                                //   width: 50,
                                //   height: 50,
                                // ),
                                Column(
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
                                            borderRadius:
                                                BorderRadius.circular(4),
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
            //     ],
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
