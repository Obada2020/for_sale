import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_sale/Add-ad/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AddUI extends StatelessWidget {
  ////////////////////////////////////////////////////////

  String? adPhoneNumber,
      adDescription,
      adLocation,
      adPicture,
      adPrice,
      accountId,
      adTypeId,
      adCatogaryId,
      catogaryDetailsId,
      adDescriptionsId,
      adTypeNameId,
      adId;

  ////////////////////////////////////////////////////////
  final items = List<String>.generate(5, (i) => "Item $i");
  var c = Get.put(AddNameController());
  String v = "A";
  Color t = Colors.red;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("إضافة إعلان"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_rounded),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kGColor),
        ),
        actions: [
          Icon(Icons.arrow_forward),
          SizedBox(width: 15),
        ],
      ),
      backgroundColor: Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: size.height * 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12),
              get(ChooseType(t: adTypeId), "نوع الإعلان"),
              SizedBox(height: 12),
              get(
                  WAddName(
                      adCatogaryId: adCatogaryId,
                      adDescriptionsId: adDescriptionsId,
                      catogaryDetailsId: catogaryDetailsId),
                  "القسم"),
              SizedBox(height: 12),
              Obx(() => Visibility(
                    child: TypesTypes(
                      adTypeId: adTypeId,
                    ),
                    visible: c.showLastCat.value,
                  )),
              SizedBox(height: 12),
              DetailsAdd(),
              SizedBox(height: 12),
              Specifications(),
              SizedBox(height: 12),
              Communicate(),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.all(18),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: kGColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 140)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {},
                      child: Center(
                        child: Text("نشر الإعلان"),
                      )),
                ),
              ),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}

Widget get(Widget x, String title) {
  return Container(
    width: MediaQuery.of(Get.context!).size.width,
    color: Colors.white,
    child: Container(
      padding: EdgeInsets.only(right: 16, top: 16, left: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 16),
          x
        ],
      ),
    ),
  );
}

class ChooseType extends StatefulWidget {
  String? t;
  ChooseType({Key? key, this.t}) : super(key: key);
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
                      widget.t = "0";
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
                      widget.t = "1";
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

class WAddName extends StatefulWidget {
  String? adCatogaryId, catogaryDetailsId, adDescriptionsId;
  WAddName({this.adCatogaryId, this.adDescriptionsId, this.catogaryDetailsId});
  @override
  _WAddNameState createState() => _WAddNameState();
}

class _WAddNameState extends State<WAddName> {
  @override
  Widget build(BuildContext context) {
    var c = Get.find<AddNameController>();
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Color(0xFF707070).withOpacity(0.01009)),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffF2F2F2),
                  Color(0xffF2F2F2),
                ],
              ),
            ),
            width: size.width - 300,
            height: 41,
            padding: EdgeInsets.all(5),
            child: Obx(() => Container(
                  child: c.addsName.isNotEmpty
                      ? DropdownButton<String>(
                          underline: SizedBox(),
                          value: widget.adCatogaryId,
                          onChanged: (value) {
                            c.fetchDataAddsCat(int.parse(value!), 1);
                            // print(value);
                          },
                          hint: Text(c.addsName[0].adCatogaryName.toString()),
                          disabledHint: Text("Disabled"),
                          elevation: 8,
                          items: c.addsName
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  child: Text(e.adCatogaryName.toString()),
                                  value: e.adCatogaryId.toString(),
                                ),
                              )
                              .toList(),
                        )
                      : Container(
                          width: 150,
                          height: 80,
                          child: LinearProgressIndicator(),
                        ),
                )),
          ),
          //*** */
          SizedBox(width: 7),
          Obx(
            () => c.show1.value
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Color(0xFF707070).withOpacity(0.01009)),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffF2F2F2),
                          Color(0xffF2F2F2),
                        ],
                      ),
                    ),
                    height: 41,
                    child: Obx(
                      () => Container(
                        child: c.addsCat1.value.list!.length != 0
                            ? DropdownButton<String>(
                                underline: SizedBox(),
                                value: widget.catogaryDetailsId,
                                onChanged: (value) {
                                  // print(value);

                                  c.fetchDataAddsCat(int.parse(value!), 2);
                                },
                                hint: Text(c
                                    .addsCat1.value.list![0].catogaryName
                                    .toString()
                                    .trim()),
                                disabledHint: Text("Disabled"),
                                elevation: 8,
                                items: c.addsCat1.value.list!
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        child: Text(e.catogaryName.toString()),
                                        value: e.catogaryDetailsId.toString(),
                                      ),
                                    )
                                    .toList(),
                              )
                            : Container(
                                width: 150,
                                height: 80,
                                child: LinearProgressIndicator(),
                              ),
                      ),
                    ),
                  )
                : Container(),
          ),
          SizedBox(width: 7),
          Obx(
            () => c.show2.value
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Color(0xFF707070).withOpacity(0.01009)),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffF2F2F2),
                          Color(0xffF2F2F2),
                        ],
                      ),
                    ),
                    // width: size.width - 600,
                    height: 41,
                    // padding: EdgeInsets.all(5),
                    child: Obx(
                      () => Container(
                        child: c.addsCat2.value.list!.length != 0
                            ? DropdownButton<String>(
                                underline: SizedBox(),
                                value: widget.adDescriptionsId,
                                onChanged: (value) {
                                  // print(value);
                                  c.fetchDataAddsCat(int.parse(value!), 3);
                                },
                                hint: Text(c.addsCat2.value.list![0]
                                    .adDetailsDescription
                                    .toString()
                                    .trim()),
                                disabledHint: Text("Disabled"),
                                elevation: 8,
                                items: c.addsCat2.value.list!
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        child: Text(
                                            e.adDetailsDescription.toString()),
                                        value: e.adDescriptionsId.toString(),
                                      ),
                                    )
                                    .toList(),
                              )
                            : Container(
                                width: 150,
                                height: 80,
                                child: LinearProgressIndicator(),
                              ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

class TypesTypes extends StatefulWidget {
  String? adTypeId;
  TypesTypes({this.adTypeId});

  @override
  _TypesTypesState createState() => _TypesTypesState();
}

class _TypesTypesState extends State<TypesTypes> {
  // List<String> list = ["الكل", "هايلوكس", "كوريلا", "لاند كروزر"];
  int selectedIndex = 0;
  var c = Get.find<AddNameController>();

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
      child: Obx(
        () => c.lastCat.value.list!.isNotEmpty
            ? ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext ctx, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        widget.adTypeId = c
                            .lastCat.value.list![index].adCatogaryId
                            .toString();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),

                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          gradient: selectedIndex == index ? kGColor : null,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      // width: 56,
                      // height: 28,
                      child: Center(
                          child: Text(
                        c.lastCat.value.list![index].adTypeName!,
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  );
                },
                itemCount: c.lastCat.value.list!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 12);
                },
              )
            : Container(
                width: 150,
                height: 80,
                child: LinearProgressIndicator(),
              ),
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
  List<Asset> images = [];
  Size size = MediaQuery.of(Get.context!).size;

  Future<void> loadAssets() async {
    setState(() {
      images = <Asset>[];
    });

    List<Asset> resultList = [];
    String? error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error!.isEmpty) error = 'No Error Dectected';
    });
  }

  Widget buildGridView() {
    if (images.isEmpty)
      return GridView.count(
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          );
        }),
      );
    else
      return Container(
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          border:
              Border.all(width: 1, color: Color(0xFF707070).withOpacity(0.09)),
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
      );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
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
                buildGridView()
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




//   List<Asset> images = [];
//   List<File> listImages = [];
//   @override
//   void initState() {
//     super.initState();
//   }

//   Widget buildGridView() {
//     return GridView.count(
//       crossAxisCount: 3,
//       children: List.generate(images.length, (index) {
//         Asset asset = images[index];
//         return AssetThumb(
//           asset: asset,
//           width: 300,
//           height: 300,
//         );
//       }),
//     );
//   }


//   void _uploadFiles() async {
//     String uid = await FlutterSecureStorage().read(key: "getTocken");
//     try {
//       var dio = Dio();
//       FormData formData = new FormData.fromMap({
//         "pictures[]": images, 
//       });
//       Response resp = await dio.post(
//         mainUrl + 'merchant/upload-galleries',
//         data: formData,
//         onSendProgress: (int sent, int total) {
//           //
//         }, 
//         options: Options(
//           headers: {
//             HttpHeaders.authorizationHeader: uid,
//           },
//         )
//       );
//       if(resp.statusCode == 200) {
//         print("============= Print Resp data: ");
//         print(resp.data);
//       }

//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> loadAssets() async {
//     List<Asset> resultList = List<Asset>();
//     try {
//       resultList = await MultiImagePicker.pickImages(
//         maxImages: 6,
//         enableCamera: true,
//         selectedAssets: images,
//         cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//         materialOptions: MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "Example App",
//           allViewTitle: "All Photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//     } on Exception catch (e) {
//       print(e);
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//     setState(() {
//       images = resultList;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         heroTag: "btn1",
//         backgroundColor: ColorHelper.orange,
//         child: Icon(Icons.add_photo_alternate),
//         onPressed: loadAssets,
//       ),
//       appBar: new AppBar(
//         title: Text('បញ្ជីរូបភាព'),
//         backgroundColor: ColorHelper.orange,
//       ),
//       body: Column(
//         children: <Widget>[
//           //Error message
//           errorMessage != "" ? 
//           Container(
//             margin: EdgeInsets.only(left: 10, right: 10, top: 10),
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(4)),
//               color: ColorHelper.red.withOpacity(0.5),
//             ),
//             child: Center(
//               child: Text("$errorMessage", style: TextStyle(color: ColorHelper.swhite, fontSize: 15),),
//             ),
//           ):
//           Container(),

//           Expanded(
//             child: Container(
//               margin: EdgeInsets.only(left: 10, right: 10, top: 10),
//               child: buildGridView(),
//             ),
//           ),
//           SafeArea(
//             child: Container(
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: ColorHelper.green,
//                 borderRadius: BorderRadius.all(Radius.circular(4))
//               ),
//               height: 50,
//               child: InkWell(
//                 onTap: () {
//                   if(images.length > 0) {
//                     setState(() {
//                       errorMessage = "";
//                     });
//                     // Call function upload multiple files
//                     _uploadFiles();
//                   } else {
//                     setState(() {
//                       errorMessage = "សូមបញ្ជូលរូបភាព";
//                     });
//                   } 
//                 },
//                 child: Center(
//                   child: Text("រួចរាល់", style: TextStyle(color: ColorHelper.swhite, fontSize: 15, fontWeight: FontWeight.w500,),),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }