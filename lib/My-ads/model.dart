// To parse this JSON data, do
//
//     final myAdsModel = myAdsModelFromJson(jsonString);

import 'dart:convert';

List<MyAdsModel> myAdsModelFromJson(String str) =>
    List<MyAdsModel>.from(json.decode(str).map((x) => MyAdsModel.fromJson(x)));

String myAdsModelToJson(List<MyAdsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyAdsModel {
  MyAdsModel({
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

  factory MyAdsModel.fromJson(Map<String, dynamic> json) => MyAdsModel(
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
