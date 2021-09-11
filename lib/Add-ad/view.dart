import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_sale/Add-ad/model.dart';
import 'package:for_sale/Add-ad/view-model.dart';
import 'package:for_sale/Ads-page/view-model.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart' hide FormData;
import 'package:multi_image_picker2/multi_image_picker2.dart';

class Myform {
  List<Asset>? images = [];
  String? adName = "", adDescription = "";
  List<Map<String, String>>? adInfo = <Map<String, String>>[];
  int? adPhoneNumber = 0,
      adPrice = 0,
      adTypeId = 0,
      adCatogaryId,
      catogaryDetailsId,
      adDescriptionId,
      adTypeNameId;
}

class AddUI extends GetView<AddNameController> {
  // final c = Get.put(AddNameController());
  var _formKey = GlobalKey<FormState>();

  ///
  ///
  ////////////////////////////////////////

  ////////////////////////////////////////
  ///
  ///
  validate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    }
    return false;
  }

  ////////////////////////////////
  bool check() {
    if (!controller.showLastCat.value) {
      Get.defaultDialog(
        title: "الرجاء قم باختيار قسم الاعلان",
        middleText: "ساعد الزبائن في الوصول لإعلانك بسهولة",
        backgroundColor: Colors.grey.shade400,
        titleStyle: TextStyle(color: Colors.black),
        middleTextStyle: TextStyle(color: Colors.black54),
      );
      return false;
    }

    if (controller.myform.value.images!.isEmpty) {
      Get.defaultDialog(
        title: "الرجاء قم باختيار صورة على الأقل للإعلان",
        middleText: "ساعد الزبائن في الوصول لإعلانك بسهولة",
        backgroundColor: Colors.grey.shade400,
        titleStyle: TextStyle(color: Colors.black),
        middleTextStyle: TextStyle(color: Colors.black54),
      );
      return false;
    }

    return true;
  }

  ////////////////////////////////
  // getNumber() async {
  //   String t = "";
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   t = sharedPreferences.getString("number")!.toString();
  //   if (t == "") {
  //     print("==================Null1==================");
  //     // Get.to(() => Signin());
  //     showAlert(Get.context!);
  //   } else
  //     print("==================GOOOOOOOO==================");
  // }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog Title Text.'),
          content: Text("Are You Sure Want To Proceed ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("NO"),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("CANCEL"),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ////////////////////////////////
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: size.height * 3),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 12),
                    get(ChooseType(), "نوع الإعلان"),
                    SizedBox(height: 12),
                    get(WAddName(), "القسم"),
                    SizedBox(height: 12),
                    Obx(() => Visibility(
                          visible: controller.showLastCat.value,
                          child: TypesTypes(),
                        )),
                    SizedBox(height: 12),
                    DetailsAdd(),
                    SizedBox(height: 12),
                    Obx(() => Visibility(
                          child: Specifications(),
                          visible: controller.showAddInfoKey.value,
                        )),
                    SizedBox(height: 12),
                    communicate(controller.myform.value),
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
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (check() && validate()) {
                                // inspect(c.myform.value);
                                if (await controller.postAdd()) {
                                  // _formKey.currentState!.reset();
                                  print("SUCCESS");
                                  // print("SUCCESSS");
                                } else
                                  print("ERROR");
                                // print(c.myform.value.adName);
                                // print(c.myform.value.adDescription);
                                // print(c.myform.value.adPhoneNumber);
                                // print(c.myform.value.adPrice);
                                // print(c.myform.value.adTypeId);
                                // print(adName);
                                // print(adName);
                              }
                            },
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
          ),
          Obx(() => Visibility(
              visible: controller.loading.value,
              child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Center(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 80, vertical: 150),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(".... Loading"),
                      ],
                    ),
                  ),
                )),
              )))
        ],
      ),
    );
  }
}

enum Types { normal, special }

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
  ChooseType({Key? key, Myform? t}) : super(key: key);
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      type = Types.normal;
                      Get.find<AddNameController>().myform.value.adTypeId = 0;
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
                      Get.find<AddNameController>().myform.value.adTypeId = 1;
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

class WAddName extends StatefulWidget {
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
            // padding : EdgeInsets.all(3),
            width: size.width - 300,
            height: 41,
            padding: EdgeInsets.all(5),
            child: Obx(() => Container(
                  child: c.addsName.isNotEmpty
                      ? DropdownButton<AddName>(
                          underline: SizedBox(),
                          // value: widget.adCatogaryId!.toString(),
                          isExpanded: true,
                          onChanged: !c.show1.value
                              ? (value) {
                                  c.myform.value.adCatogaryId =
                                      value!.adCatogaryId;
                                  c.fetchDataAddsCat(value.adCatogaryId, 1);
                                  c.fetchAddInfoKey(value.adCatogaryId);
                                }
                              : null,
                          hint: Text(c.addsName[0].adCatogaryName.toString()),
                          // disabledHint: Text("Disabled"),
                          elevation: 8,
                          items: c.addsName
                              .map(
                                (e) => DropdownMenuItem<AddName>(
                                  child: Text(e.adCatogaryName.toString()),
                                  value: e,
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
                    width: Get.width - 300,
                    padding: EdgeInsets.all(5),
                    child: Obx(
                      () => Container(
                        child: c.addsCat1.value.list!.length != 0
                            ? DropdownButton<Catogary>(
                                underline: SizedBox(),
                                isExpanded: true,

                                // isDense: true,
                                // value: widget.catogaryDetailsId.toString(),
                                onChanged: !c.show2.value
                                    ? (value) {
                                        c.myform.value.catogaryDetailsId =
                                            value!.catogaryDetailsId;
                                        // widget.form.catogaryDetailsId =
                                        //     value!.catogaryDetailsId;
                                        // widget.adDescriptionsId =
                                        //     value!.catogaryDetailsId;
                                        c.fetchDataAddsCat(
                                            value.catogaryDetailsId!, 2);
                                      }
                                    : null,
                                hint: Text(c
                                    .addsCat1.value.list![0].catogaryName
                                    .toString()
                                    .trim()),
                                // disabledHint: Text("Disabled"),
                                elevation: 8,
                                items: c.addsCat1.value.list!
                                    .map(
                                      (e) => DropdownMenuItem<Catogary>(
                                        child: Text(e.catogaryName.toString()),
                                        value: e,
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
                    width: size.width - 300,
                    height: 41,
                    padding: EdgeInsets.all(5),

                    // padding: EdgeInsets.all(5),
                    child: Obx(
                      () => Container(
                        child: c.addsCat2.value.list!.length != 0
                            ? DropdownButton<Addescription>(
                                underline: SizedBox(),
                                isExpanded: true,
                                onChanged: !c.showLastCat.value
                                    ? (value) {
                                        c.myform.value.adDescriptionId =
                                            value!.adDescriptionsId;
                                        c.fetchDataAddsCat(
                                            value.adDescriptionsId, 3);
                                      }
                                    : null,
                                hint: Text(
                                  c.addsCat2.value.list![0].adDetailsDescription
                                      .toString()
                                      .trim(),
                                ),
                                elevation: 8,
                                items: c.addsCat2.value.list!
                                    .map(
                                      (e) => DropdownMenuItem<Addescription>(
                                          child: Text(e.adDetailsDescription
                                              .toString()),
                                          value: e),
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
  @override
  _TypesTypesState createState() => _TypesTypesState();
}

class _TypesTypesState extends State<TypesTypes> {
  // List<String> list = ["الكل", "هايلوكس", "كوريلا", "لاند كروزر"];
  int selectedIndex = 0;
  //
  var c = Get.find<AddNameController>();
  //
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
                  if (index == 0)
                    c.myform.value.adTypeNameId =
                        c.lastCat.value.list![0].adCatogaryId;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        c.myform.value.adTypeNameId =
                            c.lastCat.value.list![index].adCatogaryId;
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
  @override
  _DetailsAddState createState() => _DetailsAddState();
}

class _DetailsAddState extends State<DetailsAdd> {
  var c = Get.find<AddNameController>();
  // List<Asset> images = [];
  Size size = MediaQuery.of(Get.context!).size;
  // ignore: unused_field
  String _error = 'No Error Dectected';
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: c.myform.value.images!,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
      print(error);
    }
    if (!mounted) return;

    setState(() {
      c.myform.value.images = resultList;

      _error = error;
    });
  }

  Widget buildGridView() {
    return Obx(() => c.myform.value.images!.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
              color: Color(0xFFF2F2F2),
              border: Border.all(
                  width: 1, color: Color(0xFF707070).withOpacity(0.09)),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: size.width - 20,
            height: 100,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(c.myform.value.images!.length, (index) {
                Asset asset = c.myform.value.images![index];
                return AssetThumb(
                  asset: asset,
                  width: 300,
                  height: 300,
                );
              }),
            ),
          )
        : Container(
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
          ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                onTap: loadAssets,
                child: buildGridView(),
              )
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
                  validator: (txt) =>
                      txt!.isEmpty ? "الرجاء ادخال العنوان" : null,
                  onSaved: (t) {
                    c.myform.value.adName = t!;
                  },
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
                  validator: (text) =>
                      text!.isEmpty ? "الرجاء ادخال السعر " : null,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onSaved: (s) {
                    c.myform.value.adPrice = int.parse(s!);
                  },
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
                  validator: (f) =>
                      f!.isEmpty ? " الرجاء ادخال الوصف هنا" : null,
                  onSaved: (d) {
                    c.myform.value.adDescription = d;
                    print("On Saved");
                  },
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
    );
  }
}

class Specifications extends StatelessWidget {
  // List<String> list = [
  //   "تاريخ الإنتاج",
  //   "المحرك",
  //   "قوة المحرك",
  //   "وقود المركبة",
  //   "عداد الكيلو",
  //   "الماتور",
  //   "تاريخ الإنتاج",
  //   "الماتور"
  // ];
  var c = Get.find<AddNameController>();
  // List<Map<String, String>>? temp = [];

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
                itemCount: c.addsInfoKey.length,
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
                      onSaved: (t) {
                        Map<String, String>? tempp = Map<String, String>();
                        tempp[c.addsInfoKey[index].adInfo!] = t!;
                        c.myform.value.adInfo!.add(tempp);
                      },
                      validator: (h) => h!.isEmpty ? "" : null,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintText: c.addsInfoKey[index].adInfo,
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

Widget communicate(Myform phone) {
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
                // height: 40,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (text) =>
                      text!.isEmpty ? "الرجاء ادخال رقم الهاتف للتواصل" : null,
                  onSaved: (value) {
                    phone.adPhoneNumber = int.parse(value!);
                  },
                  decoration: InputDecoration(
                    hintText: "ادخل رقم التواصل",
                    // contentPadding: EdgeInsets.only(bottom: 25),
                    contentPadding: EdgeInsets.all(10.0),
                    // errorText: "ادخل رقم التواصل",
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
    ),
  );
}
