import 'dart:convert';
import 'package:for_sale/Model/catogary_page.dart';
import 'package:for_sale/Model/chat.dart';
import 'package:for_sale/Model/favorite_ads.dart';
import 'package:for_sale/Model/home.dart';
import 'package:for_sale/Model/Add_ad.dart';
import 'package:for_sale/Model/user.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'dart:async' show Future;

class ApiService {
  //
  static String uri = "https://www.forsaleq8.com/public/api/";
  //
  // static var token = Get.find<UserController>().token;
  // //
  // static var accountId = Get.find<UserController>().accountId;

  //
  static fdataAdsNameScrl(
      adcatogaryid, catogarydetailsid, addescriptionsid) async {
    List<Ads> ads = [];
    http.Response res = await http.post(
      Uri.parse(uri + "BringAdsInName"),
      body: {
        'ad_catogary_id': adcatogaryid.toString(),
        'catogary_details_id':
            catogarydetailsid != null ? catogarydetailsid.toString() : '',
        'ad_descriptions_id':
            addescriptionsid != null ? addescriptionsid.toString() : '',
      },
      // headers: {
      // HttpHeaders.authorizationHeader:
      // 'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
      // }
    );
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        ads.add(Ads.fromJson(item));
      }
      return ads;
    } else {
      print('statuscode scrl=${res.statusCode}');
    }
  }

  static fdatahomeads(adcatogaryid) async {
    List<Ads> ads = [];
    http.Response res = await http.post(
      Uri.parse(uri + "BringAdsInName"),
      body: {
        'ad_catogary_id': adcatogaryid.toString(),
      },

      // headers: {
      //   HttpHeaders.authorizationHeader:
      // 'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
      // }
    );
    if (res.statusCode == 200) {
      // print('idcatapi $adcatogaryid');

      var body = jsonDecode(res.body);
      for (var item in body) {
        ads.add(Ads.fromJson(item));
      }
      return ads;
    } else {
      print('statuscode adshome=${res.statusCode}');
    }
  }

  static fdataMyad() async {
    List<Ads> myads = [];
    http.Response res = await http.post(
      Uri.parse(uri + "myad"),
      body: {'account_id': '${Get.find<UserController>().accountId}'},
      headers: {'Authorization': 'Bearer ${Get.find<UserController>().token}'},
    );

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      for (var item in body) {
        myads.add(Ads.fromJson(item));
      }
      return myads;
    } else {
      print('statuscode my ad=${res.statusCode}');
    }
  }

  //==============================================================
  //==============================FavoriteAds Api=======================
  static myfavorite() async {
    List<FavoriteModel> fads = [];
    http.Response res = await http.post(
      Uri.parse(uri + "myfavorite"),
      body: {'account_id': '${Get.find<UserController>().accountId}'},
      headers: {'Authorization': 'Bearer ${Get.find<UserController>().token}'},
    );
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        fads.add(FavoriteModel.fromJson(item));
      }
      // print('fads $fads');
      // print('body $body');

      return fads;
    } else {
      print('body ${res.body}');

      print('statuscode fav=${res.statusCode}');
    }
  }

  //==============================================================
  //==========================AddDeletFaveAds Api=================
  static fdatacdfav(adId) async {
    http.Response res = await http.post(
      Uri.parse(uri + "FavoriteControleItem"),
      body: {
        'account_id': Get.find<UserController>().accountId.toString(),
        'ad_id': adId.toString()
      },
      headers: {'Authorization': 'Bearer ${Get.find<UserController>().token}'},
    );
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      print('==========>${body['resualt']}');
      return body['resualt'] == 'true' ? true : false;
    } else {
      print('statuscode cdfav=${res.statusCode}');
    }
  }

  //==============================================================

  //============================== Home ===========================
  static fetchAddHome() async {
    var homeList = <HomeModel>[];
    http.Response res = await http.get(
      Uri.parse(uri + "MobileAppHomePage"),
      //  headers: {
      //   HttpHeaders.authorizationHeader:
      //       'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
      // }
    );
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      for (var item in body) {
        homeList.add(HomeModel.fromJson(item));
      }
      return homeList;
    } else {
      print('statuscode=${res.statusCode}');
    }
  }
  //============================== categ ===========================

  // get all category
  static fdataCategory(int? namCateId, int? cateDetai) async {
    var allCategory = <CategoryModel>[];
    http.Response res =
        await http.post(Uri.parse(uri + "ViewAdDescriptionPage"), body: {
      'ad_catogary_id': namCateId.toString(),
      'catogary_details_id': cateDetai.toString()
    });
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      for (var item in body) {
        allCategory.add(CategoryModel.fromJson(item));
      }
      return allCategory;
    } else {}
  }

  static fetchAdInfoKey(id) async {
    http.Response response = await http.post(
      Uri.parse(uri + "getAdInfoKey"),
      body: {'ad_catogary_id': '$id'},
      headers: {'Authorization': 'Bearer ${Get.find<UserController>().token}'},
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((x) => new AdInfoKey.fromJson(x)).toList();
    } else {
      // throw Exception('Unable to fetch Adds from the REST API');
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static fetchAddName() async {
    // await Future.delayed(Duration(seconds: 5));
    var response = await http.get(
      Uri.parse(uri + "adcatogary"),
      headers: {'Authorization': 'Bearer ${Get.find<UserController>().token}'},
    );
    // print("ffffffffffffffffffffffffffffffffffffffffff");
    // print(Get.find<UserController>().token);
    // // print(token);
    // print("ffffffffffffffffffffffffffffffffffffffffff");
    print(response.body);
    List data = jsonDecode(response.body);
    return data.map((a) => new AddName.fromJson(a)).toList();
  }

  static fetchMyadtype() async {
    var response = await http.post(
      Uri.parse(uri + "myadtype"),
      body: {'account_id': '${Get.find<UserController>().accountId}'},
      headers: {'Authorization': 'Bearer ${Get.find<UserController>().token}'},
    );
    List data = jsonDecode(response.body);
    return data
        .map((a) => new MyAdTypeModel.fromJson(a))
        .toList(); /////////////////////////////////////////////////////////////////////////
  }

  static Future<dynamic> fetchDropDown(int id, int t) async {
    String type = t == 1
        ? "ad_catogary_id"
        : t == 2
            ? "catogary_details_id"
            : "ad_descriptions_id";
    var response = await http.post(
      Uri.parse(uri + "getAllDropDownListInfo$t"),
      body: {type: "$id"},
      headers: {'Authorization': 'Bearer ${Get.find<UserController>().token}'},
    );
    var data = jsonDecode(response.body);
    return data['isTheLast'] == "yes"
        ? new LastAdd.fromJson(data)
        : t == 1
            ? new AddCat1.fromJson(data)
            : t == 2
                ? new AdDescriptions.fromJson(data)
                : new LastAdd.fromJson(data);
  }

  //============================== sign in ===========================

  static Future register(var phone) async {
    http.Response res = await http.post(
      Uri.parse(uri + "register"),
      body: {'account_phone_number': '$phone', 'account_type_id': '3'},
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      print('statuscode cdfav=${res.statusCode}');
      return false;
    }
  }

  static login(phone, serialnumber) async {
    http.Response res = await http.post(Uri.parse(uri + "login"), body: {
      'account_phone_number': '$phone',
      'serial_number': '$serialnumber'
    });
    var body = jsonDecode(res.body);
    print('statuscode cdfav=${res.statusCode}');
    if (res.statusCode == 200) {
      return UserModel.fromJson(body);
    } else {
      print('statuscode cdfav=${res.statusCode}');
      return "Login Error";
    }
  }

  //*************************************************************************** */
  static Future fetchMessage() async {
    http.Response response =
        await http.post(Uri.parse(uri + "showMessage"), body: {
      'account_id': '${Get.find<UserController>().accountId}'
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<UserController>().token}'
    });
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      print(data);
      RxList<Message> temp = <Message>[].obs;
      temp.value =
          data.map((message) => new Message.fromJson(message)).toList();
      return temp;
    }
    return false;
  }

  //***************************************************************************** */
  static Future postMessage(String? message) async {
    http.Response response =
        await http.post(Uri.parse(uri + "sendMessage"), body: {
      'account_id': '${Get.find<UserController>().accountId}',
      'message': '$message',
      'is_admin': '0',
      'read_state': '0'
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<UserController>().token}'
    });
    if (response.statusCode == 200) {
      return true;
    }
    print(response.statusCode);

    print(response.body);
    print("GG");
    return false;
  }

  ////////////////////////////////////////////////////////////////////////////////
  static Future getTerms() async {
    http.Response response = await http.get(Uri.parse(uri + "terms"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)[0]['terms_Of_Conditions'];
      // var r = ModelTerms.fromJson(?)
    } else
      return "Error";
  }

  //////////////////////////////////////////////////////////////////////////////////
  static Future logout() async {
    print("object");
    var response = await http.post(
      Uri.parse(uri + "logout"),
      headers: {'Authorization': 'Bearer ${Get.find<UserController>().token}'},
    );
    print("here response body");
    print(response.body);
    // print(token);
    if (response.statusCode == 200) return true;
    return false;
  }
  ////////////////////////////////////////////////////////////////////////////////
}
