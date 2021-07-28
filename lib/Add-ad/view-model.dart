import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:for_sale/Add-ad/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:get/get.dart' hide FormData hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:http/http.dart' as http;

class AddNameController extends GetxController {
  //
  RxList<AddName> addsName = <AddName>[].obs;
  //
  Rx<AddCat1> addsCat1 = AddCat1().obs;
  //
  Rx<Ad_descriptions> addsCat2 = Ad_descriptions().obs;
  //
  RxList<AdInfoKey> addsInfoKey = <AdInfoKey>[].obs;

  Rx<LastAdd> lastCat = LastAdd().obs;
  RxInt? index;
  RxBool isLast = false.obs;
  RxBool show1 = false.obs;
  RxBool show2 = false.obs;
  RxBool showLastCat = false.obs;
  RxBool showAddInfoKey = false.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    loading.value = true;
    var f = await ApiService.fetchAddName();
    if (f.isNotEmpty) addsName.value = f;
    loading.value = false;
  }

  void fetchDataAddsCat(int index, int t) async {
    loading.value = true;

    var f = await ApiService.fetchDropDown(index, t);
    print(f.runtimeType);
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

  // Future postImage(List<Asset> images) async {
  //   List<String> files = <String>[];
  //   Future<File> getImageFileFromAssets(Asset asset) async {
  //     final byteData = await asset.getByteData();
  //     final tempFile =
  //         File("${(await getTemporaryDirectory()).path}/${asset.name}");
  //     final file = await tempFile.writeAsBytes(
  //       byteData.buffer
  //           .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
  //     );
  //     return file;
  //   }

  //   ///**************************************** */
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse("http://192.168.130.200/signup.php"));

  //   for (int i = 0; i < images.length; i++) {
  //     // var path2 = await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
  //     var file = await getImageFileFromAssets(images[i]);
  //     // var base64Image = base64Encode(file.readAsBytesSync());
  //     // files.add(base64Image);

  //     request.files.add(
  //       http.MultipartFile(
  //         'image$i',
  //         File(file.path).readAsBytes().asStream(),
  //         File(file.path).lengthSync(),

  //         filename: file.path.split("/").last,
  //       ),
  //     );
  //   }
  //   var res = await request.send();
  //   var response = await http.Response.fromStream(res);
  //   print(response.body);
  // }

  Future postImage(List<Asset> images) async {
    Future<File> getImageFileFromAssets(Asset asset) async {
      final byteData = await asset.getByteData();

      final tempFile =
          File("${(await getTemporaryDirectory()).path}/${asset.name}");
      final file = await tempFile.writeAsBytes(
        byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );
      return file;
    }

    List<File> files = [];
    images.forEach((element) async {
      files.add(await getImageFileFromAssets(element));
      print("x");
    });
    Future.delayed(Duration(seconds: 5))
        .then((value) => files.forEach((element) {
              print(element.path.toString());
              print("FILES");
            }));

    // String uid = await FlutterSecureStorage().read(key: "getTocken");
    // print(images[0].getByteData().toString());
    // try {
    //   Dio dio = Dio();
    //   FormData formData = new FormData.fromMap({
    //     "pictures[]": files,
    //   });
    //   Response resp = await dio.post('http://192.168.130.200/signup.php',
    //       data: formData, onSendProgress: (int sent, int total) {
    //     // print(sent);
    //     //
    //   },
    //       options: Options(
    //         headers: {
    //           HttpHeaders.authorizationHeader:
    //               'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    //         },
    //       ));
    //   if (resp.statusCode == 200) {
    //     // print("============= Print Resp data: ");
    //     // print(resp.data);
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }
}
