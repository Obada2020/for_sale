import 'dart:convert';

import 'package:for_sale/Ads-page/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String url = "https://forsale-test.000webhostapp.com/public/api/";
  //==============================Ads Api=======================
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
  //==============================================================

}
