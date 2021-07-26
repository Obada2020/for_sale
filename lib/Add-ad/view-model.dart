import 'package:for_sale/Add-ad/model.dart';
import 'package:for_sale/Api/ApiService.dart';
import 'package:get/get.dart';

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
}
