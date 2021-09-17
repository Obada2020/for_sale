import 'package:for_sale/Model/home.dart';

class FavoriteModel {
  int? favoriteId;
  int? accountId;
  int? adId;
  String? createdAt;
  String? updatedAt;
  List<Ads>? ad;

  FavoriteModel(
      {this.favoriteId,
      this.accountId,
      this.adId,
      this.createdAt,
      this.updatedAt,
      this.ad});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    accountId = json['account_id'];
    adId = json['ad_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ad'] != null) {
      ad = <Ads>[];
      json['ad'].forEach((v) {
        ad!.add(new Ads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['account_id'] = this.accountId;
    data['ad_id'] = this.adId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.ad != null) {
      data['ad'] = this.ad!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
