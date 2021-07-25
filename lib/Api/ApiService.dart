import 'dart:convert';
import 'dart:io';
import 'package:for_sale/Ads-details/model.dart';
import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Category-page/model.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/Home/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:for_sale/Sign-in/model.dart';
import 'package:for_sale/Sign-in/view-model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  
  static String url = "https://forsale-test.herokuapp.com/api/";

  //==============================Ads Api=======================
  static Future fdataAds(
      int? adCatogaryId, int? catogaryDetailsId, int? adDescriptionsId) async {
    List<AdsModel> ads = [];
    http.Response res = await http.post(Uri.parse(url + "BringAds"), body: {
      'ad_catogary_id': adCatogaryId,
      'ad_descriptions_id': adDescriptionsId,
      'catogary_details_id': catogaryDetailsId,
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        ads.add(AdsModel.fromJson(item));
      }
      return ads;
    } else {
      print('statuscode scrl=${res.statusCode}');
    }
  }

  //==============================================================
  //==============================scrollhor Api=======================
  static Future fdataScrlho(
      int? adcatogaryid, int? catogarydetailsid, int? addescriptionsid) async {
    List<ScrlHorModel> scrl = [];
    http.Response res =
        await http.post(Uri.parse(url + "ScrollOfViewAds"), body: {
      'ad_catogary_id': adcatogaryid,
      'catogary_details_id': catogarydetailsid,
      'ad_descriptions_id': addescriptionsid,
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        scrl.add(ScrlHorModel.fromJson(item));
        print(item);
      }
      return scrl;
    } else {
      print('statuscode scrlh=${res.statusCode}');
    }
  }

  //==============================================================
  //==============================MyAds Api=======================
  static Future fdataMyad() async {
    List<MyAdsModel> myads = [];
    http.Response res = await http.post(Uri.parse(url + "myad"), body: {
      'account_id': '1'
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
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
  static Future fdatafavad() async {
    List<FavoriteModel> fads = [];
    http.Response res = await http.post(Uri.parse(url + "myfavorite"), body: {
      'account_id': '1'
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
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
    List<AddDeleteFavModel> f = [];
    http.Response res =
        await http.post(Uri.parse(url + "FavoriteControleItem"), body: {
      'account_id': '1',
      'ad_id': '1'
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      for (var item in body) {
        f.add(AddDeleteFavModel.fromJson(item));
      }
      return f;
    } else {
      print('statuscode cdfav=${res.statusCode}');
    }
  }

  //==============================================================

  //============================== Home ===========================
  static Future fdataHome() async {
    var homeList = <HomeModel>[];
    http.Response res =
        await http.get(Uri.parse(url + "MobileAppHomePage"), headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
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
  //============================== sign in ===========================

  static Future register(var phone) async {
    http.Response res = await http.post(Uri.parse(url + "register"), body: {
      'account_phone_number': '$phone',
      'account_type_id': '2'
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
    if (res.statusCode == 200) {
      return true;
      // var body = jsonDecode(res.body);
      // return body[0]["user"][0]["serial_number"];

    } else {
      print('statuscode cdfav=${res.statusCode}');
      return false;
    }
  }

  static login(phone, serialnumber) async {
    print(phone);
    print(serialnumber);

    http.Response res = await http.post(Uri.parse(url + "login"), body: {
      'account_phone_number': '$phone',
      'serial_number': '$serialnumber'
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
    var body = jsonDecode(res.body);
    print('statuscode cdfav=${res.statusCode}');
    if (res.statusCode == 200) {
      return User.fromJson(body);
    } else {
      print('statuscode cdfav=${res.statusCode}');
      return null;
    }
  }

  //===============================================================

  //============================== categ ===========================

  // get all category
  static Future fdataCategory(int? namCateId, int? cateDetai) async {
    var allCategory = <CategoryModel>[];
    http.Response res =
        await http.post(Uri.parse(url + "ViewAdDescriptionPage"), body: {
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
}
