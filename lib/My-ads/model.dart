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
    this.adPicture,
    this.mangerAccept,
    this.adPrice,
    this.adInfo,
    this.accountId,
    this.adTypeId,
    this.adCatogaryId,
    this.catogaryDetailsId,
    this.adDescriptionsId,
    this.adTypeNameId,
    this.createdAt,
    this.updatedAt,
  });

  int? adId;
  String? adName;
  String? adPhoneNumber;
  String? adDescription;
  String? adPicture;
  int? mangerAccept;
  String? adPrice;
  String? adInfo;
  int? accountId;
  int? adTypeId;
  int? adCatogaryId;
  int? catogaryDetailsId;
  int? adDescriptionsId;
  int? adTypeNameId;
  String? createdAt;
  String? updatedAt;

  factory MyAdsModel.fromJson(Map<String, dynamic> json) => MyAdsModel(
        adId: json["ad_id"],
        adName: json["ad_name"],
        adPhoneNumber: json["ad_phone_number"],
        adDescription: json["ad_description"],
        adPicture: json["ad_picture"],
        mangerAccept: json["manger_accept"],
        adPrice: json["ad_price"],
        adInfo: json["ad_info"],
        accountId: json["account_id"],
        adTypeId: json["ad_type_id"],
        adCatogaryId: json["ad_catogary_id"],
        catogaryDetailsId: json["catogary_details_id"],
        adDescriptionsId: json["ad_descriptions_id"],
        adTypeNameId: json["ad_type_name_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "ad_id": adId,
        "ad_name": adName,
        "ad_phone_number": adPhoneNumber,
        "ad_description": adDescription,
        "ad_picture": adPicture,
        "manger_accept": mangerAccept,
        "ad_price": adPrice,
        "ad_info": adInfo,
        "account_id": accountId,
        "ad_type_id": adTypeId,
        "ad_catogary_id": adCatogaryId,
        "catogary_details_id": catogaryDetailsId,
        "ad_descriptions_id": adDescriptionsId,
        "ad_type_name_id": adTypeNameId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
