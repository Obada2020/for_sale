import 'dart:convert';
import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String url = "https://forsale-test.000webhostapp.com/public/api/";
  //==============================Ads Api=======================
  static Future fdataAds() async {
    List<AdsModel> ads = [];
    http.Response res = await http.post(Uri.parse(url + "BringAds"), body: {
      'ad_catogary_id': '1',
      'catogary_details_id': '1',
      'ad_descriptions_id': '1'
    });
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        ads.add(AdsModel.fromJson(item));
      }
      return ads;
    } else {
      print('statuscode=${res.statusCode}');
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
    });
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        ads.add(AdsModel.fromJson(item));
      }
      return ads;
    } else {
      print('statuscode=${res.statusCode}');
    }
  }

  //==============================================================
  //==============================MyAds Api=======================
  static Future fdataMyad() async {
    List<MyAdsModel> myads = [];
    http.Response res =
        await http.post(Uri.parse(url + "myad"), body: {'account_id': '1'});
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        myads.add(MyAdsModel.fromJson(item));
      }
      return myads;
    } else {
      print('statuscode=${res.statusCode}');
    }
  }

  //==============================================================
  //==============================FavoriteAds Api=======================
  static Future fdatafavad() async {
    List<FavoriteModel> myads = [];
    http.Response res = await http
        .post(Uri.parse(url + "myfavorite"), body: {'account_id': '1'});
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        myads.add(FavoriteModel.fromJson(item));
      }
      return myads;
    } else {
      print('statuscode=${res.statusCode}');
    }
  }

  //==============================================================
  //==============================scrollhor Api=======================
  static Future fdataScrlho() async {
    List<ScrlHorModel> scrl = [];
    http.Response res = await http.post(Uri.parse(url + "ScrollOfViewAds"),
        body: {
          'ad_catogary_id': "1",
          'catogary_details_id': "1",
          'ad_descriptions_id': "1"
        });
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for (var item in body) {
        scrl.add(ScrlHorModel.fromJson(item));
        print(item);
      }
      return scrl;
    } else {
      print('statuscode=${res.statusCode}');
    }
  }
  //==============================================================

}
