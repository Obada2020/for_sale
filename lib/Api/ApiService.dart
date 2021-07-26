import 'dart:convert';
import 'dart:io';
import 'package:for_sale/Add-ad/model.dart';
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
  // static Future fdataAds(
  //     int? adcatogaryid, int? catogarydetailsid, int? addescriptionsid) async {
  //   List<AdsModel> ads = [];
  //   http.Response res = await http.post(Uri.parse(url + "BringAds"), body: {
  //     'ad_catogary_id': adcatogaryid.toString(),
  //     'catogary_details_id': catogarydetailsid.toString(),
  //     'ad_descriptions_id': addescriptionsid.toString()
  //   }, headers: {
  //     HttpHeaders.authorizationHeader:
  //         'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
  //   });
  //   if (res.statusCode == 200) {
  //     var body = jsonDecode(res.body);

  //     for (var item in body) {
  //       ads.add(AdsModel.fromJson(item));
  //     }
  //     return ads;
  //   } else {
  //     print('statuscode ads=${res.statusCode}');
  //   }
  // }

  //==============================================================
  //==============================AdsByNameScroll Api=======================
  static Future fdataAdsNameScrl(
<<<<<<< HEAD
      int? adcatogaryid, int? catogarydetailsid, int? addescriptionsid) async {
    List<AdsModel> ads = [];
    http.Response res =
        await http.post(Uri.parse(url + "BringAdsInName"), body: {
      'ad_catogary_id': '1',
      // adcatogaryid.toString(),
      'catogary_details_id': '1',
      // catogarydetailsid.toString(),
      'ad_descriptions_id': '1',
      // addescriptionsid.toString(),
      // 'ad_type_name_id': '',
=======
      adcatogaryid, catogarydetailsid, addescriptionsid, adtypenameid) async {
    List<AdsModel> ads = [];
    http.Response res =
        await http.post(Uri.parse(url + "BringAdsInName"), body: {
      'ad_catogary_id': adcatogaryid.toString(),
      'catogary_details_id': catogarydetailsid.toString(),
      'ad_descriptions_id': addescriptionsid.toString(),
      'ad_type_name_id': '',
>>>>>>> 1f3c457fe810ee5f6b4fb4af0001f2eb6368dd54
      // adtypenameid.toString()
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        ads.add(AdsModel.fromJson(item));
      }
<<<<<<< HEAD

=======
>>>>>>> 1f3c457fe810ee5f6b4fb4af0001f2eb6368dd54
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
      'ad_catogary_id': '1',
      // adcatogaryid.toString(),
      'catogary_details_id': '1',
      // catogarydetailsid.toString(),
      'ad_descriptions_id': '1',

      // adtypenameid.toString()
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      print('scroool**************');
      print(adcatogaryid);
      print(catogarydetailsid);
      print(addescriptionsid);
      print('scroool**************');
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
    http.Response res =
        await http.post(Uri.parse(url + "FavoriteControleItem"), body: {
      'account_id': '30',
      'ad_id': '4'
    }, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 3|likuthd1UP5bpfHTnepNHFk1oKHCGTNKJTXEodVI'
    });
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

  static Future<List<AdInfoKey>?> fetchAdInfoKey(id) async {
    http.Response response = await http
        .post(Uri.parse(url + "getAdInfoKey"), body: {'ad_catogary_id': '$id'});

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((x) => new AdInfoKey.fromJson(x)).toList();
    } else {
      // throw Exception('Unable to fetch Adds from the REST API');
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static Future<List<AddName>> fetchAddName() async {
    var response = await http.get(
      Uri.parse(url + "adcatogary"),
    );
    List data = jsonDecode(response.body);

    return data.map((visit) => new AddName.fromJson(visit)).toList();
  }
  //============================== sign in ===========================

  static Future<dynamic> fetchDropDown(int id, int t) async {
    String type = t == 1
        ? "ad_catogary_id"
        : t == 2
            ? "catogary_details_id"
            : "ad_descriptions_id";
    var response = await http.post(
      Uri.parse(url + "getAllDropDownListInfo$t"),
      body: {type: "$id"},
    );
    var data = jsonDecode(response.body);
    return data['isTheLast'] == "yes"
        ? new LastAdd.fromJson(data)
        : t == 1
            ? new AddCat1.fromJson(data)
            : t == 2
                ? new Ad_descriptions.fromJson(data)
                : new LastAdd.fromJson(data);
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
}
