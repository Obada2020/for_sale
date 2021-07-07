// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'dart:convert';

List<FavoriteModel> favoriteModelFromJson(String str) =>
    List<FavoriteModel>.from(
        json.decode(str).map((x) => FavoriteModel.fromJson(x)));

String favoriteModelToJson(List<FavoriteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoriteModel {
  FavoriteModel({
    this.favoriteId,
    this.accountId,
    this.adId,
    this.createdAt,
    this.updatedAt,
    this.ad,
  });

  String? favoriteId;
  String? accountId;
  String? adId;
  String? createdAt;
  String? updatedAt;
  List<Ad>? ad;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        favoriteId: json["favorite_id"],
        accountId: json["account_id"],
        adId: json["ad_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        ad: List<Ad>.from(json["ad"].map((x) => Ad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "favorite_id": favoriteId,
        "account_id": accountId,
        "ad_id": adId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "ad": List<dynamic>.from(ad!.map((x) => x.toJson())),
      };
}

class Ad {
  Ad({
    this.adId,
    this.adName,
    this.adPhoneNumber,
    this.adDescription,
    this.adLocation,
    this.adPicture,
    this.mangerAccept,
    this.adPrice,
    this.adCatogaryId,
    this.accountId,
    this.adTypeId,
    this.createdAt,
    this.updatedAt,
  });

  String? adId;
  String? adName;
  String? adPhoneNumber;
  String? adDescription;
  String? adLocation;
  String? adPicture;
  String? mangerAccept;
  String? adPrice;
  String? adCatogaryId;
  String? accountId;
  String? adTypeId;
  String? createdAt;
  String? updatedAt;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        adId: json["ad_id"],
        adName: json["ad_name"],
        adPhoneNumber: json["ad_phone_number"],
        adDescription: json["ad_description"],
        adLocation: json["ad_location"],
        adPicture: json["ad_picture"],
        mangerAccept: json["manger_accept"],
        adPrice: json["ad_price"],
        adCatogaryId: json["ad_catogary_id"],
        accountId: json["account_id"],
        adTypeId: json["ad_type_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "ad_id": adId,
        "ad_name": adName,
        "ad_phone_number": adPhoneNumber,
        "ad_description": adDescription,
        "ad_location": adLocation,
        "ad_picture": adPicture,
        "manger_accept": mangerAccept,
        "ad_price": adPrice,
        "ad_catogary_id": adCatogaryId,
        "account_id": accountId,
        "ad_type_id": adTypeId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
