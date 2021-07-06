import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:for_sale/style.dart';
import 'dart:ui';
import '';

class AddUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final items = List<String>.generate(5, (i) => "Item $i");
    return Scaffold(
        appBar: AppBar(
          title: Text("إضافة إعلان"),
          centerTitle: true,
          backgroundColor: gg,
          actions: [
            Icon(Icons.arrow_forward),
            SizedBox(width: 15),
          ],
        ),
        body: Container(
          color: Color(0xFFF2F2F2),
          child: Column(
            children: [
              SizedBox(height: 13),
              Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.299,
                color: Colors.white,
                child: Container(
                  padding:
                      EdgeInsets.only(right: 16, top: 16, left: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "نوع الأعلان",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 16),
                      Type_Adds()
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 35, left: 16, bottom: 18, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "القسم",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 13),

                      //           Container(
                      //   width: size.width,
                      //   height: size.height * 0.083,
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     shrinkWrap: true,
                      //     itemBuilder: (BuildContext ctx, int index) {
                      //       return RawMaterialButton(
                      //         onPressed: () {
                      //           setState(() {
                      //             selectindex = index;
                      //           });
                      //         },
                      //         child: Container(
                      //           margin: EdgeInsets.fromLTRB(13, 10, 13, 14),
                      //           padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                      //           height: 30,
                      //           decoration: BoxDecoration(
                      //               border: Border.all(color: Color(0xff333333)),
                      //               gradient: selectindex == index
                      //                   ? kGColor
                      //                   : LinearGradient(
                      //                       begin: Alignment.topCenter,
                      //                       end: Alignment.bottomCenter,
                      //                       colors: [
                      //                         Color(0xffF2F2F2),
                      //                         Color(0xffF2F2F2),
                      //                       ],
                      //                     ),
                      //               color: Color(0xffF2F2F2),
                      //               borderRadius: BorderRadius.circular(4)),
                      //           child: Text(
                      //             'data data',
                      //             style: selectindex == index
                      //                 ? klabelStyleBold11light
                      //                 : klabelStyleBold11dark,
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //     itemCount: 20,
                      //   ),
                      // ),

                      //     Container(
                      //         height: 50,
                      //         width: size.width,
                      //         color: Colors.red,
                      //         child: SingleChildScrollView(
                      //           // reverse: true,
                      //           child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.end,
                      //               children: [
                      //                 Expanded(child: Text("ddd")),
                      //                 Expanded(child: Text("ddd")),
                      //                 Expanded(child: Text("ddd")),
                      //               ]),
                      // ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class Type_Adds extends StatefulWidget {
  @override
  _Type_AddsState createState() => _Type_AddsState();
}

class _Type_AddsState extends State<Type_Adds> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Types type = Types.normal;
    var t = Colors.red;
    var kActiveBorder = Border.all(color: Colors.black);
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      type = Types.special;
                    });
                  },
                  child: Container(
                    height: size.height * 0.125,
                    decoration: BoxDecoration(
                        color: Color(0xFFE8CECE),
                        border: type == Types.special
                            ? Border.all(color: Colors.black)
                            : null,
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    child: Center(
                      child: Text(
                        "إعلان\n مميز",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text("لديك عدد 15 إعلان"),
                Text("مدة الإعلان : 15 يوم")
              ],
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      type = Types.normal;
                      print("object");
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: type == Types.normal
                            ? Border.all(color: Colors.black)
                            : null,
                        color: Color(0xFF487485).withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    height: size.height * 0.125,
                    child: Center(
                      child: Text(
                        "إعلان \nعادي",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text("لديك عدد 15 إعلان"),
                Text("مدة الإعلان : 15 يوم")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum Types { normal, special }

// class test extends StatefulWidget {

//   @override
//   _testState createState() => _testState();
// }

// class _testState extends State<test> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//               width: size.width,
//               height: size.height * 0.083,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 itemBuilder: (BuildContext ctx, int index) {
//                   return RawMaterialButton(
//                     onPressed: () {
//                       setState(() {
//                         selectindex = index;
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.fromLTRB(13, 10, 13, 14),
//                       padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
//                       height: 30,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Color(0xff333333)),
//                           gradient: selectindex == index
//                               ? kGColor
//                               : LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Color(0xffF2F2F2),
//                                     Color(0xffF2F2F2),
//                                   ],
//                                 ),
//                           color: Color(0xffF2F2F2),
//                           borderRadius: BorderRadius.circular(4)),
//                       child: Text(
//                         'data data',
//                         style: selectindex == index
//                             ? klabelStyleBold11light
//                             : klabelStyleBold11dark,
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: 20,
//               ),
//             );
//   }
// }