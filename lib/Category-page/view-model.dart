import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Category-page/model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  int? adCatogaryId;
  int? catogaryDetailsId;
  CategoryController({this.adCatogaryId, this.catogaryDetailsId});
  var categoryList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fdata();
  }

  fdata() async {
    List<CategoryModel> allCategory = await ApiService.fdataCategory(
        this.adCatogaryId, this.catogaryDetailsId);
    categoryList.value = allCategory;
  }
}
