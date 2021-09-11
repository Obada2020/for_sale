import 'dart:convert';
import 'dart:io';

import 'package:for_sale/Add-ad/model.dart';
import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Category-page/model.dart';
import 'package:for_sale/Chat-WithAdmin/model.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/Home/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:for_sale/Sign-in/model.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:get/get.dart' hide Response ;
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'dart:async' show Future;

class ApiService {
  //
  static String uri = "https://www.forsaleq8.com/public/api/";
  //
  static var token = Get.find<UserController>().token;
  //
  static Future fdataAdsNameScrl(
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

  static Future fdatahomeads(adcatogaryid) async {
    List<AdsHomeModel> ads = [];
    http.Response res = await http.post(
      Uri.parse(uri + "BringAdsInName"),
      body: {
        'ad_catogary_id': adcatogaryid.toString(),
      },

      // headers: {
      //   HttpHeaders.authorizationHeader:
      //       'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
      // }
    );
    if (res.statusCode == 200) {
      // print('idcatapi $adcatogaryid');

      var body = jsonDecode(res.body);
      for (var item in body) {
        ads.add(AdsHomeModel.fromJson(item));
      }
      return ads;
    } else {
      print('statuscode adshome=${res.statusCode}');
    }
  }

  static Future fdataMyad() async {
    List<MyAdsModel> myads = [];
    http.Response res = await http.post(
      Uri.parse(uri + "myad"), body: {'account_id': '35'},

      // headers: {
      //   HttpHeaders.authorizationHeader:
      //       'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
      // }
    );
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        myads.add(MyAdsModel.fromJson(item));
      }
      return myads;
    } else {
      print('statuscode my ad=${res.statusCode}');
    }
  }

  //==============================================================
  //==============================FavoriteAds Api=======================
  static Future myfavorite() async {
    List<FavoriteModel> fads = [];
    http.Response res = await http.post(
      Uri.parse(uri + "myfavorite"), body: {'account_id': '1'},

      // headers: {
      //   HttpHeaders.authorizationHeader:
      //       'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
      // }
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
  static Future fdatacdfav() async {
    http.Response res = await http.post(
      Uri.parse(uri + "FavoriteControleItem"),
      body: {'account_id': '31', 'ad_id': '5'},

      //  headers: {
      //   HttpHeaders.authorizationHeader:
      //       'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
      // }
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
  static Future fetchAddHome() async {
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
  static Future fdataCategory(int? namCateId, int? cateDetai) async {
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

  static Future<List<AdInfoKey>?> fetchAdInfoKey(id) async {
    http.Response response = await http
        .post(Uri.parse(uri + "getAdInfoKey"), body: {'ad_catogary_id': '$id'});

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((x) => new AdInfoKey.fromJson(x)).toList();
    } else {
      // throw Exception('Unable to fetch Adds from the REST API');
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static Future<List<AddName>> () async {
    
    var response = await http.get(
      Uri.parse(uri + "adcatogary"),
      headers: {
        HttpHeaders.authorizationHeader: token.value,
      },
    );
    List data = jsonDecode(response.body);
    return data.map((a) => new AddName.fromJson(a)).toList();
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
      headers: {HttpHeaders.authorizationHeader: token.value},
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
    print(phone);
    print(serialnumber);

    http.Response res = await http.post(Uri.parse(uri + "login"), body: {
      'account_phone_number': '$phone',
      'serial_number': '$serialnumber'
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
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
  static Future fetchMessage(int? accountid) async {
    http.Response response = await http.post(Uri.parse(uri + "showMessage"),
        body: {'account_id': '$accountid'},
        headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      RxList<Message> temp = <Message>[].obs;
      print("fetch Data");
      temp.value =
          data.map((message) => new Message.fromJson(message)).toList();
      return temp;
    }
    return false;
  }

  //***************************************************************************** */
  static Future postMessage(int? accountid, String? message) async {
    http.Response response =
        await http.post(Uri.parse(uri + "sendMessage"), body: {
      'account_id': '$accountid',
      'message': '$message',
      'is_admin': '0',
      'read_state': '0'
    });
    if (response.statusCode == 200) {
      return true;
    }
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
    var response = await http.post(Uri.parse(uri + "logout"), headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
    if (response.statusCode == 200) return true;
    return false;
  }
  ////////////////////////////////////////////////////////////////////////////////
}
