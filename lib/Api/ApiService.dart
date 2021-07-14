import 'dart:convert';
import 'package:for_sale/Ads-page/model.dart';
import 'package:for_sale/Favorite-ads/model.dart';
import 'package:for_sale/My-ads/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String url = "https://forsale-test.000webhostapp.com/public/api/";

  static Future fdataAds() async {
    List<AdsModel> ads = [];
    http.Response res = await http.get(Uri.parse(url + "ad"));
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

  


}
