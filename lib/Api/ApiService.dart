import 'dart:convert';
import 'dart:io';
import 'package:for_sale/Ads-details/model.dart';
import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Category-page/model.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/Home/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:for_sale/Sign-in/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String url = "https://forsale-test.herokuapp.com/api/";
  //==============================Ads Api=======================
  static Future fdataAds() async {
    List<AdsModel> ads = [];
    http.Response res = await http.post(Uri.parse(url + "BringAds"), body: {
      'ad_catogary_id': '1',
      'catogary_details_id': '8',
      'ad_descriptions_id': '7'
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
      print('statuscode ads=${res.statusCode}');
    }
  }

  //==============================================================
  //==============================AdsByNameScroll Api=======================
  static Future fdataAdsNameScrl() async {
    List<AdsModel> ads = [];
    http.Response res =
        await http.post(Uri.parse(url + "BringAdsInName"), body: {
      'ad_catogary_id': '1',
      'catogary_details_id': '1',
      'ad_descriptions_id': '1',
      'ad_type_name_id': '1'
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
    http.Response res = await http.post(Uri.parse(url + "myfavorite"), body: {
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
  //==============================scrollhor Api=======================
  static Future fdataScrlho() async {
    List<ScrlHorModel> scrl = [];
    http.Response res =
        await http.post(Uri.parse(url + "ScrollOfViewAds"), body: {
      'ad_catogary_id': '1',
      'catogary_details_id': '1',
      'ad_descriptions_id': '1'
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

  //===============================================================
  //============================Signin=============================
  static Future fdataSignin(var phone) async {
    List<SigninModel> sign = [];
    http.Response res = await http.post(Uri.parse(url + "register"), body: {
      'account_phone_number': '$phone',
      'account_type_id': '2'
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      //   for (var item in body) {
      //     sign.add(SigninModel.fromJson(item));
      //   }
      //   return sign;
      // } else {
      print('statuscode cdfav=${res.statusCode}');
    }
  }

  //===============================================================
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
