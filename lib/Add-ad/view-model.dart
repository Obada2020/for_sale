import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:for_sale/Model/Add_ad.dart';
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:get/get.dart' hide FormData hide Response hide MultipartFile;
import 'package:multi_image_picker2/multi_image_picker2.dart';

class AddNameController extends GetxController {
  //
  Rx<Myform> myform = Myform().obs;
  //
  RxList<AddName> addsName = <AddName>[].obs;
  //
  Rx<AddCat1> addsCat1 = AddCat1().obs;
  //
  Rx<AdDescriptions> addsCat2 = AdDescriptions().obs;
  //
  RxList<AdInfoKey> addsInfoKey = <AdInfoKey>[].obs;
  //
  Rx<LastAdd> lastCat = LastAdd().obs;
  //
  RxInt? index;
  //
  RxBool isLast = false.obs;
  //
  RxBool show1 = false.obs;
  //
  RxBool show2 = false.obs;
  //
  RxBool showLastCat = false.obs;
  //
  RxBool showAddInfoKey = false.obs;
  //
  RxBool loading = false.obs;
  //
  RxList<MyAdTypeModel> myAdTypelist = <MyAdTypeModel>[].obs;
  RxBool loadingMyType = false.obs;
  //
  @override
  void onReady() async {
    super.onReady();
    print("here init the addNameController ");
    Get.find<UserController>().number.isNotEmpty
        ? fetchData()
        : print("No thinks well do");
  }

  //
  void fetchData() async {
    loading.value = true;
    loadingMyType.value = true;
    var f = await ApiService.fetchAddName();
    var m = await ApiService.fetchMyadtype();
    if (m.isNotEmpty) myAdTypelist.value = m;
    if (f.isNotEmpty) addsName.value = f;
    loading.value = false;
    loadingMyType.value = false;
  }

  void fetchDataAddsCat(int? index, int t) async {
    loading.value = true;
    var f = await ApiService.fetchDropDown(index!, t);
    // print(f.runtimeType);
    if (f.isTheLast == "yes" || t == 3) {
      lastCat.value = f;
      showLastCat.value = true;
    } else {
      t == 1
          ? addsCat1.value = f
          : t == 2
              ? addsCat2.value = f
              : lastCat.value = f;
      t == 1
          ? show1.value = true
          : t == 2
              ? show2.value = true
              : showLastCat.value = true;
      showLastCat.value = false;
    }
    loading.value = false;
  }

  void fetchAddInfoKey(int id) async {
    loading.value = true;
    var result = await ApiService.fetchAdInfoKey(id);
    if (result != null) {
      addsInfoKey.value = result;
      showAddInfoKey.value = true;
    } else {
      throw Exception('Unable to fetch Adds from the REST API');
    }
    loading.value = false;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<bool> postAdd() async {
    //
    //
    loading.value = true;
    //
    myform.value.adTypeId = myAdTypelist
        .where(
          (s) => s.isSpecial == myform.value.isSpecial,
        )
        .first
        .adTypeId!;
    //
    // print(Get.find<UserController>().accountId);
    // //
    // print(myform.value.adTypeId);
    //
    Dio dio = Dio();
    //
    List<MultipartFile> allMultiFiles = [];
    //
    List<Map<String, String>> x = [];
    x.add(myform.value.adInfo);
    //
    for (Asset asset in myform.value.images!) {
      ByteData byteData = await asset.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      var multipartFile = new MultipartFile.fromBytes(
        imageData,
        filename: asset.name,
      );
      allMultiFiles.add(multipartFile);
    }
    //
    FormData formData = new FormData.fromMap(
      {
        "images[]": allMultiFiles,
        "ad_name": myform.value.adName.toString(),
        "ad_phone_number": myform.value.adPhoneNumber.toString(),
        "ad_description": myform.value.adDescription.toString(),
        "ad_price": myform.value.adPrice.toString(),
        "ad_info": x,
        "account_id": Get.find<UserController>().accountId.value.toString(),
        "ad_type_id": myform.value.adTypeId.toString(),
        "ad_catogary_id": myform.value.adCatogaryId.toString(),
        "catogary_details_id": myform.value.catogaryDetailsId.toString(),
        "ad_descriptions_id": myform.value.adDescriptionId.toString(),
        "ad_type_name_id": myform.value.adTypeNameId.toString(),
        "is_special": myform.value.isSpecial.toString(),
        "manger_accept": "0",
      },
    );
    //
    // formData.fields.forEach((element) {
    //   print(element);
    // });
    //
    try {
      var response = await dio.post(
        "https://www.forsaleq8.com/public/api/ad",
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Get.find<UserController>().token}'
          },
        ),
      );
      //
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Success Publish the Ad');
        await Get.delete<AddNameController>();
        Get.put(AddNameController());
        update();
        // update();
        // this.dispose();
        // this.onInit();
        loading.value = false;
        return true;
      } else {
        loading.value = false;
        // update();

        print(response.data);
        print(response.statusCode);
        print(response.statusMessage);

        return false;
      }
    } catch (e) {
      loading.value = false;
      print(e);
      return false;
    }
  }
}
