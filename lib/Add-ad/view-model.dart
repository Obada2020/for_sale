import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:for_sale/Add-ad/model.dart';
import 'package:for_sale/Add-ad/view.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:get/get.dart' hide FormData hide Response hide MultipartFile;
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';

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
  void onInit() async {
    super.onInit();
    print("here init the addNameController ");
    Get.find<UserController>().number.isNotEmpty
        ? fetchData()
        : print("No thinks well do");
  }

  //
  fetchData() async {
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

    Dio dio = Dio();
    try {
      List<MultipartFile> allMultiFiles = [];
      for (Asset asset in myform.value.images!) {
        ByteData byteData = await asset.getByteData();
        List<int> imageData = byteData.buffer.asUint8List();
        // print(imageData);
        var multipartFile = new MultipartFile.fromBytes(
          imageData,
          filename: asset.name,
        );
        allMultiFiles.add(multipartFile);
      }
      //
      // FormData formData = FormData.fromMap({'images[0]': allMultiFiles[0]});
      //
      for (var i = 0; i < myform.value.images!.length; i++) {}

      // FormData formData = FormData.fromMap(
      //   myform.value.images.forEach(
      //     (element)
      //       return {'images[0]': allMultiFiles[0]};

      //   )
      // );

      //
      var response = await dio.post("https://www.forsaleq8.com/public/api/ad",
        );
      if (response.statusCode == 200) {
        print('done');
        return true;
      } else {
        print('not save image. Error !!');
      }
    } catch (e) {
      print(e.toString());
    }
    return false;

    //
    // loading.value = true;
    // List<String> files = <String>[];
//     Future<File> getImageFileFromAssets(Asset asset) async {
//       final byteData = await asset.getByteData();
//       final tempFile =
//           File("${(await getTemporaryDirectory()).path}/${asset.name}");
//       final file = await tempFile.writeAsBytes(
//         byteData.buffer
//             .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
//       );
//       return file;
//     }

//     // ///**************************************** */
//     // var request = http.MultipartRequest(
//     //     'POST', Uri.parse("http://192.168.130.200/signup.php"));
//     // for (int i = 0; i < images.length; i++) {
//     //   // var path2 = await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
//     //   File file = await getImageFileFromAssets(images[i]);
//     //   print(file.path);
//     //   // var base64Image = base64Encode(file.readAsBytesSync());
//     //   // files.add(base64Image);

//     //   request.files.add(
//     //     http.MultipartFile(
//     //       'image$i',
//     //       File(file.path).readAsBytes().asStream(),
//     //       File(file.path).lengthSync(),
//     //       filename: file.path.split("/").last,
//     //     ),
//     //   );
//     // }
//     List<MultipartFile> files = [];
//     myform.value.images!.forEach((element) async {
//       File r = await getImageFileFromAssets(element);
//       // var t = oImage(base64: base64Encode(r.readAsBytesSync()), name: element.name);
//       // files.add(await MultipartFile.fromFile(r.path ,r.));
//       // files.add(await getImageFileFromAssets(element));
//       // print("x");
//     });
//     files.forEach((element) {
//       print("sssssssssss");
//     });
//     inspect(files);
//     // Future.delayed(Duration(seconds: 5))
//     //     .then((value) => files.forEach((element) {
//     //           print(element.toString());
//     //           print("FILES");
//     //         }));
//     // inspect(myform.value);
//     //
//     //
//     FormData formData = new FormData.fromMap({
//       "ad_picture": files,
//       "ad_name": "myform.value.adName",
//       "ad_phone_number": "0951251635",
//       "ad_description": "myform.value.adDescription",
//       "manger_accept": "1",
//       "ad_price": 300,
//       "ad_info": "null",
//       "account_id": 24,
//       "ad_type_id": 34, //myform.value.adTypeId,
//       "ad_catogary_id": 1,
//       "catogary_details_id": 1,
//       "ad_description_id": 1,
//       "ad_type_name_id": 1,
//       "is_special": 1
//     });
//     inspect(formData);
//     // Dio dio = Dio();
//     // FormData formData = new FormData.fromMap({
//     //   "ad_picture": files,
//     //   "ad_name": myform.value.adName,
//     //   "ad_phone_number": myform.value.adPhoneNumber,
//     //   "ad_description": myform.value.adDescription,
//     //   "manger_accept": "1",
//     //   "ad_price": myform.value.adPrice,
//     //   "ad_info": jsonEncode(myform.value.adInfo),
//     //   "account_id": 14,
//     //   "ad_type_id": 16, //myform.value.adTypeId,
//     //   "ad_catogary_id": myform.value.adCatogaryId,
//     //   "catogary_details_id": myform.value.catogaryDetailsId,
//     //   "ad_description_id": myform.value.adDescriptionId,
//     //   "ad_type_name_id": myform.value.adTypeNameId,
//     //   "is_special": 0
//     // });
//     // inspect(formData);
//     // inspect(files);
//     // print(jsonEncode(files));

//     //
//     Response resp;
//     try {
//       resp = await dio.post('https://www.forsaleq8.com/public/api/ad',
//           data: formData, onSendProgress: (int sent, int total) {
//         // print(sent);
//         //
//       },
//           options: Options(
//             headers: {
//               HttpHeaders.authorizationHeader:
//                   'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
//             },
//           ));
//       print("//////////////////");
//       // print(resp.data);
//       // print(resp.headers);
// // print(resp.request);
//       // print(resp.statusCode);
//       // print("//////////////////");
//       loading.value = false;
//       // inspect(resp);
//       if (resp.statusCode == 201) {
//         myform.value = Myform();
//         show1.value = false;
//         show2.value = false;
//         showLastCat.value = false;
//         showAddInfoKey.value = false;
//         return true;
//       }
//       return false;
//     } catch (e) {
//       print(e);
//       inspect(e);
//       loading.value = false;
//       return false;
//     }
    // if (resp.statusCode == 200) {

    // }
    // var res = await request.send();

    // print(resp.);

    // Future postADD() async {}
    // var res = await request.send();
    // var response = await http.Response.fromStream(res);
    // print(response.body);
  }
}

class oImage {
  String? base64;
  String? name;
  oImage({this.base64, this.name});
}
