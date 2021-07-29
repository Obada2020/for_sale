import 'package:for_sale/Api/ApiService.dart';
import 'package:for_sale/Home/model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var homeList = <HomeModel>[].obs;
  var ads = <AdsHomeModel>[].obs;
  List<AdsHomeModel>? dummysearch;
  int? id;
  HomeController({this.id});
  @override
  void onInit() {
    super.onInit();
    fdata();
    fdatadadshome(id);
  }

  fdatadadshome(id) async {
    print('idcatctrl $id');
    List<AdsHomeModel> adby = await ApiService.fdatahomeads(id);
    ads.value = adby;
    dummysearch = ads.toList();
  }

  fdata() async {
    List<HomeModel> myad = await ApiService.fdataHome();

    homeList.value = myad;

    print({"================>": myad});
  }
  //==================================search========================

  fileserch(String query) async {
    List<AdsHomeModel> dummylistdata = <AdsHomeModel>[];
    if (query.isNotEmpty && dummysearch!.isNotEmpty) {
      dummysearch!.forEach((item) {
        var service = item;
        if (service.adName!.toLowerCase().contains(query.toLowerCase()) ||
            service.adDescription!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            service.adPrice!.toLowerCase().contains(query.toLowerCase())) {
          dummylistdata.add(service);
        }
      });
      ads.clear();
      ads.addAll(dummylistdata);
      update();
    } else {
      print(dummysearch!.length);
      ads.clear();
      ads.addAll(dummysearch!);
      update();
    }
  }
  //====================================================================
}
