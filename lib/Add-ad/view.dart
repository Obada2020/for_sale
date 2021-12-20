import 'dart:developer';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_sale/Add-ad/view-model.dart';
import 'package:for_sale/Home/view-model.dart';
import 'package:for_sale/Model/Add_ad.dart';
import 'package:for_sale/constant/constant.dart';
import 'package:get/get.dart' hide FormData;
import 'package:multi_image_picker2/multi_image_picker2.dart';

class Myform {
  //
  RxList<Asset>? images = <Asset>[].obs;
  //
  String? adName = "", adDescription = "";
  //
  Map<String, String> adInfo = Map<String, String>();
  //
  int? adPhoneNumber = 0,
      adPrice = 0,
      adTypeId = 0,
      adCatogaryId,
      catogaryDetailsId,
      adDescriptionId,
      adTypeNameId;

  int? isSpecial = 0;
}

class AddUI extends GetView<AddNameController> {
  //
  //
  bool validate() {
    if (controller.formKey.value.currentState!.validate()) {
      controller.formKey.value.currentState!.save();
      return true;
    }
    return false;
  }

  //
  bool check() {
    //
    print(controller.myAdTypelist[controller.myform.value.isSpecial!].adCount);
    // inspect(controller.myAdTypelist);
    if (controller.myAdTypelist[controller.myform.value.isSpecial!].adCount ==
        0) {
      Get.defaultDialog(
        title: "لم يتبقى لديك عدد اعلانات كافية ",
        middleText: "قم بالتواصل مع الادارة لتفاصيل اكثر",
        backgroundColor: Colors.grey.shade400,
        titleStyle: TextStyle(color: Colors.black),
        middleTextStyle: TextStyle(color: Colors.black54),
      );
      return false;
    }

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

  ///
  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog Title Text.',
              style: Get.theme.textTheme.bodyText1),
          content: Text("Are You Sure Want To Proceed ?",
              style: Get.theme.textTheme.bodyText1),
          actions: <Widget>[
            TextButton(
              child: Text("YES", style: Get.theme.textTheme.bodyText1),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("NO", style: Get.theme.textTheme.bodyText1),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("CANCEL", style: Get.theme.textTheme.bodyText1),
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
    //
    Size size = MediaQuery.of(context).size;
    //
    // print(Get.find<AddNameController>().myform.value.images!.value.toString());
    //
    return Stack(
      children: [
        GetBuilder<AddNameController>(
          builder: (ctx) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: size.height * 3),
              child: Form(
                key: controller.formKey.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 18),
                    Geet(
                      ChoseType(),
                      "type-ad".tr,
                    ),
                    SizedBox(height: 18),
                    Geet(
                      WAddName(),
                      "section-ad".tr,
                    ),
                    SizedBox(height: 8),
                    Obx(() => Visibility(
                          visible: controller.showLastCat.value,
                          child: TypesTypes(),
                        )),
                    SizedBox(height: 18),
                    DetailsAdd(),
                    SizedBox(height: 18),
                    Obx(
                      () => Visibility(
                        child: Specifications(),
                        visible: controller.showAddInfoKey.value,
                      ),
                    ),
                    SizedBox(height: 18),
                    Communicate(controller.myform.value),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: kGColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                  vertical: 13,
                                  horizontal: 140,
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                Colors.transparent,
                              ),
                            ),
                            onPressed: () async {
                              // await Get.delete<AddNameController>();
                              // Get.put(AddNameController());
                              inspect(controller.myform);
                              FocusScope.of(context).unfocus();
                              if (check() && validate()) {
                                // inspect(controller.myform.value);
                                var t = await controller.postAdd();
                                // await Future.delayed(Duration(seconds: 5));
                                if (t) {
                                  AwesomeDialog(
                                    context: Get.context!,
                                    animType: AnimType.SCALE,
                                    dialogType: DialogType.SUCCES,
                                    body: Text('تم إضافة الإعلان بنجاح',
                                        textAlign: TextAlign.center,
                                        style: Get.theme.textTheme.bodyText1!
                                            .copyWith(fontSize: 20)),
                                    title: 'This is Ignored',
                                    desc: 'This is also Ignored',
                                    btnOkOnPress: () {},
                                  )..show();
                                  //
                                  // controller.formKey.value.currentState!.reset();
                                  //
                                  Get.find<HomeController>().fetchHomeList();
                                  //
                                  // controller.myform.refresh();
                                  // Get.reload<AddNameController>();
                                  print("SUCCESS");
                                  // controller.myform.value.adCatogaryId =
                                  //     controller.addsName[0].adCatogaryId;
                                  // controller.show1.value = false;
                                  // controller.show2.value = false;

                                  controller.update(); //
                                } else
                                  AwesomeDialog(
                                    btnOkColor: Colors.red,
                                    context: Get.context!,
                                    animType: AnimType.SCALE,
                                    dialogType: DialogType.ERROR,
                                    body: Text(
                                        'تأكد من الاتصال من الانترنت وحاول مجدداً',
                                        textAlign: TextAlign.center,
                                        style: Get.theme.textTheme.bodyText1!
                                            .copyWith(fontSize: 20)),
                                    title: 'This is Ignored',
                                    desc: 'This is also Ignored',
                                    btnOkOnPress: () {},
                                  )..show();
                                print("ERROR");
                              }
                            },
                            child: Center(
                              child: Text("details-ad14".tr,
                                  style: Get.theme.textTheme.bodyText1),
                            )),
                      ),
                    ),
                    SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => Visibility(
            visible: controller.loading.value || controller.loadingMyType.value,
            child: BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 80, vertical: 150),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15,
                      ),
                    ),
                  ),
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
                        Text(".... Loading",
                            style: Get.theme.textTheme.bodyText1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum Types { normal, special }

class Geet extends StatelessWidget {
  Geet(this.x, this.title, [this.textStyle]);
  var x, title, textStyle;
  @override
  Widget build(BuildContext v) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Theme.of(v).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.18),
              offset: Offset(0.0, -1), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        width: MediaQuery.of(Get.context!).size.width,
        // color: Get.theme.primaryColor,
        padding: EdgeInsets.only(right: 16, top: 16, left: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Get.textTheme.button!.copyWith(fontSize: 20),
            ),
            SizedBox(height: 16),
            x
          ],
        ),
      );
}

class ChoseType extends StatefulWidget {
  @override
  _ChoseTypeState createState() => _ChoseTypeState();
}

class _ChoseTypeState extends State<ChoseType> {
  Types type = Types.normal;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(Get.context!).primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      type = Types.normal;
                      //is_special ==> normal 0 ==> special 1
                      Get.find<AddNameController>().myform.value.isSpecial = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Get.find<AddNameController>()
                                  .myform
                                  .value
                                  .isSpecial ==
                              0
                          ? Border.all(
                              color: Get.theme.primaryColorDark, width: 3)
                          : null,
                      color: Get.theme.cardColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          13,
                        ),
                      ),
                    ),
                    height: size.height * 0.125,
                    child: Center(
                      child: Text(
                        'type-ad1'.tr,
                        style: Get.textTheme.button!.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // Text("لديك عدد 15 إعلان"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("type-ad3".tr, style: Get.textTheme.button),
                    Obx(
                      () => Get.find<AddNameController>().loadingMyType.value
                          ? Text("?")
                          : Get.find<AddNameController>().myAdTypelist.isEmpty
                              ? Text("?")
                              : Text(
                                  " " +
                                      Get.find<AddNameController>()
                                          .myAdTypelist[0]
                                          .adCount
                                          .toString() +
                                      " ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                ),
                    ),
                    Text("type-ad4".tr, style: Get.textTheme.button),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("type-ad5".tr, style: Get.textTheme.button),
                    Obx(
                      () => Get.find<AddNameController>().loadingMyType.value
                          ? Text("?")
                          : Get.find<AddNameController>().myAdTypelist.isEmpty
                              ? Text("?")
                              : Text(
                                  " " +
                                      Get.find<AddNameController>()
                                          .myAdTypelist[0]
                                          .adTime
                                          .toString() +
                                      " ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                ),
                    ),
                    Text('type-ad6'.tr, style: Get.textTheme.button),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        type = Types.special;
                        Get.find<AddNameController>().myform.value.isSpecial =
                            1;
                      },
                    );
                  },
                  child: Container(
                    height: size.height * 0.125,
                    decoration: BoxDecoration(
                      color: Get.theme.hintColor,
                      border: Get.find<AddNameController>()
                                  .myform
                                  .value
                                  .isSpecial ==
                              1
                          ? Border.all(
                              color: Get.theme.primaryColorDark, width: 3)
                          : null,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          13,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text('type-ad2'.tr,
                          style: Get.textTheme.button!.copyWith(fontSize: 18)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("type-ad3".tr, style: Get.textTheme.button),
                    Obx(
                      () => Get.find<AddNameController>().loadingMyType.value
                          ? Text("?")
                          : Get.find<AddNameController>().myAdTypelist.isEmpty
                              ? Text("?")
                              : Text(
                                  " " +
                                      Get.find<AddNameController>()
                                          .myAdTypelist[1]
                                          .adCount
                                          .toString() +
                                      " ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                ),
                    ),
                    Text("type-ad4".tr, style: Get.textTheme.button),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("type-ad5".tr, style: Get.textTheme.button),
                    Obx(
                      () => Get.find<AddNameController>().loadingMyType.value
                          ? Text("?")
                          : Get.find<AddNameController>().myAdTypelist.isEmpty
                              ? Text("?")
                              : Text(
                                  " " +
                                      Get.find<AddNameController>()
                                          .myAdTypelist[1]
                                          .adTime
                                          .toString() +
                                      " ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                ),
                    ),
                    Text('type-ad6'.tr, style: Get.textTheme.button),
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
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            child: GetBuilder<AddNameController>(
              builder: (c) => Container(
                child: c.addsName.isNotEmpty
                    ? DropdownButton<AddName>(
                        underline: SizedBox(),
                        iconEnabledColor: Colors.black,

                        // value: widget.adCatogaryId!.toString(),
                        isExpanded: true,
                        onChanged:
                            //  !c.show1.value?
                            (value) {
                          inspect(c.addsName);
                          c.myform.value.adCatogaryId = value!.adCatogaryId;
                          c.myform.value.catogaryDetailsId = 0;
                          c.myform.value.adDescriptionId = 0;
                          c.show2.value = false;
                          c.addsCat1.value = AddCat1();
                          c.fetchDataAddsCat(value.adCatogaryId, 1);
                          c.fetchAddInfoKey(value.adCatogaryId);
                          c.update();
                        },
                        // : null,
                        hint: Obx(
                          () => c.myform.value.adCatogaryId != null
                              ? Text(
                                  c.addsName
                                      .where(
                                        (p0) =>
                                            p0.adCatogaryId ==
                                            c.myform.value.adCatogaryId,
                                      )
                                      .first
                                      .adCatogaryName,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              : Text(
                                  c.addsName[0].adCatogaryName,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                        ),
                        // disabledHint: Text("Disabled"),
                        elevation: 8,
                        items: c.addsName
                            .map(
                              (e) => DropdownMenuItem<AddName>(
                                child: Text(
                                  e.adCatogaryName.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
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
          ),
          SizedBox(width: 7),
          GetBuilder<AddNameController>(
            builder: (c) => c.show1.value
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
                        child: c.addsCat1.value.list?.length != 0
                            ? DropdownButton<Catogary>(
                                iconEnabledColor: Colors.black,

                                underline: SizedBox(),
                                isExpanded: true,
                                // isDense: true,
                                // value: widget.catogaryDetailsId.toString(),
                                onChanged:
                                    //  !c.show2.value ?
                                    (value) {
                                  //
                                  c.myform.value.catogaryDetailsId =
                                      value!.catogaryDetailsId;
                                  //
                                  // c.myform.value.adDescriptionId = 0;
                                  //
                                  // widget.form.catogaryDetailsId =
                                  //     value!.catogaryDetailsId;
                                  // widget.adDescriptionsId =
                                  //     value!.catogaryDetailsId;
                                  //
                                  // c.myform.value.catogaryDetailsId = 0;
                                  c.myform.value.adDescriptionId = 0;
                                  // c.show2.value = false;
                                  c.addsCat2.value = AdDescriptions();
                                  c.show2.value = false;
                                  //
                                  c.fetchDataAddsCat(
                                      value.catogaryDetailsId!, 2);
                                  //
                                  c.update();
                                  //
                                },
                                // : null,
                                hint: Text(
                                  c.addsCat1.value.list?[0].catogaryName
                                          .toString()
                                          .trim() ??
                                      "",
                                  style: TextStyle(color: Colors.black),
                                ),
                                // disabledHint: Text("Disabled"),
                                elevation: 8,
                                items: c.addsCat1.value.list != null
                                    ? c.addsCat1.value.list!
                                        .map(
                                          (e) => DropdownMenuItem<Catogary>(
                                            child: Text(
                                              e.catogaryName.toString(),
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            value: e,
                                          ),
                                        )
                                        .toList()
                                    : [],
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
          GetBuilder<AddNameController>(
            builder: (c) => c.show2.value
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
                        child: c.addsCat2.value.list?.length != 0
                            ? DropdownButton<Addescription>(
                                underline: SizedBox(),
                                iconEnabledColor: Colors.black,
                                isExpanded: true,

                                onChanged:
                                    //  !c.showLastCat.value?
                                    (value) {
                                  //
                                  c.myform.value.adDescriptionId =
                                      value!.adDescriptionsId;
                                  //
                                  c.fetchDataAddsCat(value.adDescriptionsId, 3);
                                  //
                                  c.update();
                                  //
                                },
                                // : null,
                                hint: Text(
                                  c.addsCat2.value.list?[0].adDetailsDescription
                                          .toString()
                                          .trim() ??
                                      "",
                                  style: TextStyle(color: Colors.black),
                                ),
                                elevation: 8,
                                items: c.addsCat2.value.list?.isNotEmpty ??
                                        false
                                    ? c.addsCat2.value.list!
                                        .map(
                                          (e) =>
                                              DropdownMenuItem<Addescription>(
                                                  child: Text(
                                                    e.adDetailsDescription
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  value: e),
                                        )
                                        .toList()
                                    : [],
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
        color: Theme.of(context).primaryColor == Colors.black
            ? Colors.black
            : Colors.white,
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
                          border:
                              Border.all(color: Get.theme.primaryColorLight),
                          gradient: selectedIndex == index ? kGColor : null,
                          color: Colors.white,
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

class DetailsAdd extends GetView<AddNameController> {
  // var c = Get.find<AddNameController>();
  // List<Asset> images = [];
  Size size = MediaQuery.of(Get.context!).size;
  // ignore: unused_field
  String _error = 'No Error Dectected';
  List<Asset> resultList = <Asset>[];
  Future<void> loadAssets() async {
    String error = 'No Error Detected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: controller.myform.value.images!,
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
    // if (!mounted) return;

    // setState(
    // () {
    controller.myform.value.images!.value = resultList;
    _error = error;
    resultList = [];
    // },
    // );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   print("Hellow");
  // }

  @override
  Widget build(BuildContext context) {
    print(resultList.length);
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).primaryColor,
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
            padding: const EdgeInsets.only(left: 16, top: 19, right: 16),
            child: Text("details-ad1".tr,
                style: Get.textTheme.button!.copyWith(fontSize: 20)),
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "details-ad2".tr,
                  style: TextStyle(
                    color: Theme.of(Get.context!).primaryColor == Colors.black
                        ? Colors.white
                        : Colors.grey.shade700,
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                  onTap: loadAssets,
                  child: Obx(() => controller.myform.value.images!.isNotEmpty
                      ? Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            border: Border.all(
                                width: 1,
                                color: Color(0xFF707070).withOpacity(0.09)),
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          width: size.width - 20,
                          height: 100,
                          child: GridView.count(
                            crossAxisCount: 3,
                            children: List.generate(
                              controller.myform.value.images!.length,
                              (index) {
                                var asset =
                                    controller.myform.value.images![index];
                                return AssetThumb(
                                  asset: asset,
                                  width: 300,
                                  height: 300,
                                );
                              },
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            border: Border.all(
                                width: 1,
                                color: Color(0xFF707070).withOpacity(0.09)),
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          width: size.width - 20,
                          height: 100,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("upload",
                                    style:
                                        TextStyle(color: Colors.grey.shade500)),
                                Text("details-ad3".tr,
                                    style:
                                        TextStyle(color: Colors.grey.shade500))
                              ],
                            ),
                          ),
                        )))
            ],
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "details-ad4".tr,
                  style: TextStyle(
                    color: Theme.of(Get.context!).primaryColor == Colors.black
                        ? Colors.white
                        : Colors.grey.shade700,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  validator: (txt) => txt!.isEmpty ? "details-ad5".tr : null,
                  style: TextStyle(color: Colors.black),
                  onSaved: (t) {
                    controller.myform.value.adName = t!;
                  },
                  decoration: InputDecoration(
                      hintText: "details-ad5".tr,
                      hintStyle: TextStyle(color: Colors.grey.shade500),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "details-ad6".tr,
                  style: TextStyle(
                    color: Theme.of(Get.context!).primaryColor == Colors.black
                        ? Colors.white
                        : Colors.grey.shade700,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  validator: (text) => text!.isEmpty ? "details-ad6".tr : null,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onSaved: (s) {
                    controller.myform.value.adPrice = int.parse(s!);
                  },
                  decoration: InputDecoration(
                    hintText: "details-ad7".tr,
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    // prefix: Text("د.ك"),
                    // prefixIcon: Text("data"),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "details-ad8".tr,
                        style: TextStyle(
                            color: Colors.grey.shade500,
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
                      ),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "details-ad9".tr,
                  style: TextStyle(
                    color: Theme.of(Get.context!).primaryColor == Colors.black
                        ? Colors.white
                        : Colors.grey.shade700,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  validator: (f) => f!.isEmpty ? "details-ad10".tr : null,
                  style: TextStyle(color: Colors.black),
                  onSaved: (d) {
                    controller.myform.value.adDescription = d;
                    print("On Saved");
                  },
                  // expands: true,
                  maxLines: 15,
                  minLines: 5,
                  decoration: InputDecoration(
                      // contentPadding: new EdgeInsets.symmetric(
                      //     vertical: 50.0, horizontal: 10.0),
                      hintText: "details-ad10".tr,
                      hintStyle: TextStyle(color: Colors.grey.shade500),
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
  final c = Get.find<AddNameController>();
  // List<Map<String, String>>? temp = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).primaryColor == Colors.black
            ? Colors.black
            : Colors.white,
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
            padding:
                const EdgeInsets.only(left: 16, top: 19, right: 16, bottom: 8),
            child: Text('details-ad15'.tr,
                style: Get.textTheme.button!.copyWith(fontSize: 20)),
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
                      //
                      // Map<String, String>? tempp = Map<String, String>();
                      // tempp["\'${c.addsInfoKey[index].adInfo!}\'"] =
                      //     "\'${t!}\'";
                      // print(tempp);
                      //
                      if (t != null) {
                        c.myform.value
                            .adInfo["${c.addsInfoKey[index].adInfo!}"] = "$t";
                      }
                      //
                      //
                    },
                    style: TextStyle(color: Colors.black),
                    // validator: (h) => h!.isEmpty ? "" : null,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: c.addsInfoKey[index].adInfo,
                      hintStyle: TextStyle(color: Colors.grey.shade700),
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
      ),
    );
  }
}

class Communicate extends StatelessWidget {
  final phone;
  Communicate(this.phone);
  @override
  Widget build(BuildContext x) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Theme.of(x).primaryColor,
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
              padding: const EdgeInsets.only(left: 16, top: 19, right: 16),
              child: Text("details-ad11".tr,
                  style: Get.textTheme.button!.copyWith(fontSize: 20)),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "details-ad12".tr,
                    style: TextStyle(
                      color: Theme.of(Get.context!).primaryColor == Colors.black
                          ? Colors.white
                          : Colors.grey.shade700,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    // height: 40,
                    child: Container(
                      color: Theme.of(Get.context!).primaryColor,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (text) =>
                            text!.isEmpty ? "details-ad13".tr : null,
                        style: TextStyle(color: Colors.black),
                        onSaved: (value) {
                          phone.adPhoneNumber = int.parse(value!);
                        },
                        decoration: InputDecoration(
                          hintText: "details-ad13".tr,
                          hintStyle: TextStyle(color: Colors.grey.shade500),
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
                ),
                SizedBox(height: 18),
              ],
            ),
          ],
        ),
      );
}
