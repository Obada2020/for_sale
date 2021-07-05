import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 16, end: 16, top: 20, bottom: 13),
          child: Column(
            children: [
              //start title category
              Container(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          //title
                          containerTitle(),
                          //category
                          Container(
                            height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  containerCategory(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 10),
                              itemCount: 5,
                            ),
                          ),
                          //offer
                          Container(
                            height: 275,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  containerOffer(context, size),
                              itemCount: 5,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 10),
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ],
          )),
    );
  }

  Widget containerTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("العقارات", style: klabelStyleTitle),
        Row(
          children: [
            Text("عرض الكل", style: klabelStyleShowAll),
            Icon(Icons.chevron_right_sharp, color: Colors.blue, size: 15),
          ],
        ),
      ],
    );
  }

  Widget containerCategory() {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 20),
      height: 120.0,
      width: 105.83,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("img/5321.jpg"),
              Text("منازل للبيع", style: klabelStyleTitleCategory)
            ],
          ),
        ),
      ),
    );
  }

  Widget containerOffer(context, size) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: 200,
      height: 275,
      margin: EdgeInsetsDirectional.only(bottom: 20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          //image
          Image.asset(
            "img/country house.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //title
                Text(
                  "هذا النص هو نص تجريبي من مولد النص العربي",
                  style: klabelStyleTitleCategory,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20),
                //button and timer
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
        ],
      ),
    );
  }
}
