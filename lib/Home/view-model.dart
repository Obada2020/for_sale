import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Home/model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var homeList = <HomeModel>[].obs;
  var adsHome = <AdsHomeModel>[].obs;
  List<AdsHomeModel>? searchHome;

  // int? id;
  // HomeController({this.id});

  @override
  void onInit() {
    super.onInit();
    fdata();
    //fdatadadshome(id);
  }

  fdatadadshome(id) async {
    print('idcatctrl $id');
    List<AdsHomeModel> adby = await ApiService.fdatahomeads(id);
    adsHome.value = adby;
    searchHome = adsHome.toList();
  }

  fdata() async {
    List<HomeModel> myad = await ApiService.fdataHome();

    homeList.value = myad;

    print({"================>": myad});
  }
  // //==================================searchHome========================

  // fileserchHome(String query) async {
  //   List<AdsHomeModel> dummylistdataHome = <AdsHomeModel>[];
  //   if (query.isNotEmpty && dummysearchHome!.isNotEmpty) {
  //     dummysearchHome!.forEach((item) {
  //       var serviceHome = item;
  //       if (serviceHome.adName!.toLowerCase().contains(query.toLowerCase()) ||
  //           serviceHome.adDescription!
  //               .toLowerCase()
  //               .contains(query.toLowerCase()) ||
  //           serviceHome.adPrice!.toLowerCase().contains(query.toLowerCase())) {
  //         dummylistdataHome.add(serviceHome);
  //       }
  //     });
  //     adsHome.clear();
  //     adsHome.addAll(dummylistdataHome);
  //     update();
  //   } else {
  //     print(dummysearchHome!.length);
  //     adsHome.clear();
  //     adsHome.addAll(dummysearchHome!);
  //     update();
  //   }
  // }
  // //====================================================================
}
