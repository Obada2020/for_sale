import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';

class FavoriteAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbodyColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
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
              'الإعلانات المفضلة',
              style: klabelAppbarStyle,
            ),
          ),
        ),
      ),
      body: //================================grid view==========================

          Container(
        margin: EdgeInsets.only(top: 16, right: 16, left: 16),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 9,
              mainAxisSpacing: 9,
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
    );
  }
}
