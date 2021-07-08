<<<<<<< HEAD
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:for_sale/style.dart';
=======
import 'package:flutter/material.dart';
import 'package:for_sale/constant/constant.dart';
import 'dart:ui';
>>>>>>> 8bc73247ad22a6982a8e8a89af6bf16f4a37f56b

class AddUI extends StatefulWidget {
  @override
  _AddUIState createState() => _AddUIState();
}

class _AddUIState extends State<AddUI> {
  final items = List<String>.generate(5, (i) => "Item $i");

  String v = "A";
  Color t = Colors.red;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("إضافة إعلان"),
          centerTitle: true,
<<<<<<< HEAD
          backgroundColor: gg,
          leading: Icon(Icons.arrow_back_rounded),
=======
          backgroundColor: kbodyColor,
          actions: [
            Icon(Icons.arrow_forward),
            SizedBox(width: 15),
          ],
>>>>>>> 8bc73247ad22a6982a8e8a89af6bf16f4a37f56b
        ),
        backgroundColor: Color(0xFFF2F2F2),
        body: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: size.height * 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12),
              Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.299,
                color: Colors.white,
                child: Container(
                  padding:
                      EdgeInsets.only(right: 16, top: 16, left: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "نوع الأعلان",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 16),
                      ChooseType(),
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
                      EdgeInsets.only(top: 19, left: 16, bottom: 18, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "القسم",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 13),
                      test(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              TypesTypes(),
              SizedBox(height: 12),
              DetailsAdd(),
              SizedBox(height: 12),
              Specifications(),
              SizedBox(height: 12),
              Communicate(),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.all(18),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            vertical: 13, horizontal: 140)),
                        backgroundColor: MaterialStateProperty.all(gg)),
                    onPressed: () {},
                    child: Center(
                      child: Text("نشر الإعلان"),
                    )),
              ),
              SizedBox(height: 18),
            ],
          ),
        )));
  }
}

class ChooseType extends StatefulWidget {
  ChooseType({Key? key}) : super(key: key);

  @override
  _ChooseTypeState createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {
  Types type = Types.normal;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.18),
            offset: Offset(0.0, -1), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      // color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      type = Types.normal;
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
          SizedBox(width: 15),
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
        ],
      ),
    );
  }
}

enum Types { normal, special }

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  String? v;
  String defaultValue = "السيارات";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return
        // Conta
        Container(
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: Color(0xFF707070).withOpacity(0.01009)),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        gradient:
            // selectindex == index
            //     ? kGColor :
            LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffF2F2F2),
            Color(0xffF2F2F2),
          ],
        ),
      ),
      width: size.width - 300,
      // height: size.height * 0.083,
      height: 41,
      padding: EdgeInsets.all(5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext ctx, int index) {
          return DropdownButton<String>(
            underline: SizedBox(),
            // decoration: InputDecoration(
            //     enabledBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(color: Colors.white))),
            value: v,
            onChanged: (value) {
              setState(() {
                v = value;
              });
            },
            hint: Text(defaultValue),
            disabledHint: Text("Disabled"),
            elevation: 8,
            // style: TextStyle(color: Colors.green, fontSize: 16),
            items: [
              DropdownMenuItem<String>(
                child: Text(
                  "السيارات",
                  // style: TextStyle(color: Colors.black),
                ),
                value: "1",
              ),
              DropdownMenuItem<String>(
                child: Text("عقارات"),
                value: "2",
              ),
              DropdownMenuItem<String>(
                child: Text("الألكترونيات"),
                value: "3",
              ),
            ],
          );
        },
        itemCount: 1,
      ),
    );
  }
}

class TypesTypes extends StatefulWidget {
  TypesTypes({Key? key}) : super(key: key);

  @override
  _TypesTypesState createState() => _TypesTypesState();
}

class _TypesTypesState extends State<TypesTypes> {
  List<String> list = ["الكل", "هايلوكس", "كوريلا", "لاند كروزر"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 70,
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.18),
            offset: Offset(0.0, -1), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext ctx, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),

              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: selectedIndex == index ? gg : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              // width: 56,
              // height: 28,
              child: Center(child: Text(list[index])),
            ),
          );
        },
        itemCount: 4,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 12);
        },
      ),
    );
  }
}

class DetailsAdd extends StatefulWidget {
  DetailsAdd({Key? key}) : super(key: key);

  @override
  _DetailsAddState createState() => _DetailsAddState();
}

class _DetailsAddState extends State<DetailsAdd> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      child: Container(
        // height: 500,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.18),
              offset: Offset(0.0, -1), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 19, right: 16),
              child: Text(
                "تفاصيل الإعلان",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    "صورة الإعلان",
                    style: TextStyle(
                      color: Color(0xFF333333).withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      border: Border.all(
                          width: 1, color: Color(0xFF707070).withOpacity(0.09)),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    width: size.width - 20,
                    height: 100,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text("upload"), Text("انقر لرفع الصور")],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    "العنوان",
                    style: TextStyle(
                      color: Color(0xFF333333).withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "ادخل عنوان الإعلان",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0x59707070), width: 0.0),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF2F2F2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF707070).withOpacity(0.09),
                        ))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    "السعر",
                    style: TextStyle(
                      color: Color(0xFF333333).withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "ادخل سعر الإعلان بالدينار الكويتي",
                        // prefix: Text("د.ك"),
                        // prefixIcon: Text("data"),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "د.ك",
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0x59707070), width: 0.0),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF2F2F2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF707070).withOpacity(0.09),
                        ))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    "الوصف",
                    style: TextStyle(
                      color: Color(0xFF333333).withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    // expands: true,
                    maxLines: 15,
                    minLines: 5,
                    decoration: InputDecoration(
                        // contentPadding: new EdgeInsets.symmetric(
                        //     vertical: 50.0, horizontal: 10.0),
                        hintText: "ادخل وصف الإعلان",
                        // prefix: Text("د.ك"),
                        // prefixIcon: Text("data"),

                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0x59707070), width: 0.0),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF2F2F2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF707070).withOpacity(0.09),
                        ))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class Specifications extends StatefulWidget {
  Specifications({Key? key}) : super(key: key);

  @override
  _SpecificationsState createState() => _SpecificationsState();
}

class _SpecificationsState extends State<Specifications> {
  List<String> list = [
    "تاريخ الإنتاج",
    "المحرك",
    "قوة المحرك",
    "وقود المركبة",
    "عداد الكيلو",
    "الماتور",
    "تاريخ الإنتاج",
    "الماتور"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.18),
              offset: Offset(0.0, -1), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 19, right: 16),
              child: Text(
                "تفاصيل الإعلان",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: size.width,
              // height: 500,
              child: GridView.builder(
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // maxCrossAxisExtent: 200,
                  childAspectRatio: 6 / 2,
                  // mainAxisExtent: 40,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                  crossAxisCount: 2,
                ),
                itemBuilder: (ctx, index) {
                  return SizedBox(
                    height: 25,
                    width: 25,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: list[index],
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0x59707070), width: 0.0),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF2F2F2),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF707070).withOpacity(0.09),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 18),
          ],
        ));
  }
}

class Communicate extends StatefulWidget {
  Communicate({Key? key}) : super(key: key);

  @override
  _CommunicateState createState() => _CommunicateState();
}

class _CommunicateState extends State<Communicate> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.18),
              offset: Offset(0.0, -1), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 19, right: 16),
              child: Text(
                "التواصل",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    "رقم التواصل (الهاتف)",
                    style: TextStyle(
                      color: Color(0xFF333333).withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "ادخل رقم التواصل",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0x59707070), width: 0.0),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF2F2F2),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF707070).withOpacity(0.09),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
              ],
            ),
          ],
        ));
  }
}
