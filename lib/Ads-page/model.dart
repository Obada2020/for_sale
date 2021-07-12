import 'dart:convert';

List<AdsModel> adsFromJson(String str) =>
    List<AdsModel>.from(json.decode(str).map((x) => AdsModel.fromJson(x)));

String adsToJson(List<AdsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdsModel {
  AdsModel({
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

  int? adId;
  String? adName;
  int? adPhoneNumber;
  String? adDescription;
  String? adLocation;
  String? adPicture;
  int? mangerAccept;
  int? adPrice;
  int? adCatogaryId;
  int? accountId;
  int? adTypeId;
  String? createdAt;
  String? updatedAt;

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
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
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
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
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
      };
}
// To parse this JSON data, do
//
//     final scrlHorModel = scrlHorModelFromJson(jsonString);

List<ScrlHorModel> scrlHorModelFromJson(String str) => List<ScrlHorModel>.from(
    json.decode(str).map((x) => ScrlHorModel.fromJson(x)));

String scrlHorModelToJson(List<ScrlHorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScrlHorModel {
  ScrlHorModel({
    this.adTypeNameId,
    this.adTypeName,
    this.adId,
    this.adCatogaryId,
    this.catogaryDetailsId,
    this.adDescriptionsId,
    this.createdAt,
    this.updatedAt,
  });

  int? adTypeNameId;
  String? adTypeName;
  int? adId;
  int? adCatogaryId;
  int? catogaryDetailsId;
  int? adDescriptionsId;
  String? createdAt;
  String? updatedAt;

  factory ScrlHorModel.fromJson(Map<String, dynamic> json) => ScrlHorModel(
        adTypeNameId: json["ad_type_name_id"],
        adTypeName: json["ad_type_name"],
        adId: json["ad_id"],
        adCatogaryId: json["ad_catogary_id"],
        catogaryDetailsId: json["catogary_details_id"],
        adDescriptionsId: json["ad_descriptions_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "ad_type_name_id": adTypeNameId,
        "ad_type_name": adTypeName,
        "ad_id": adId,
        "ad_catogary_id": adCatogaryId,
        "catogary_details_id": catogaryDetailsId,
        "ad_descriptions_id": adDescriptionsId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
