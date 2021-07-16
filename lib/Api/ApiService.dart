import 'dart:convert';
import 'dart:io';

import 'package:for_sale/Add-ad/model.dart';
import 'package:for_sale/Ads-details/model.dart';
import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/Home/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String url = "http://forsale-test.000webhostapp.com/public/api/";

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

  //**************************************************************************************** */
  static Future<List<AddName>> fetchAddName() async {
    var response = await http.get(
      Uri.parse(url + "adcatogary"),
    );
    List data = jsonDecode(response.body);

    return data.map((visit) => new AddName.fromJson(visit)).toList();
  }

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
}
