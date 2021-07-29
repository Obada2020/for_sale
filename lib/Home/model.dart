import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) =>
    List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
  HomeModel({
    this.adCatogaryId,
    this.adCatogaryName,
    this.createdAt,
    this.updatedAt,
    this.catogaryDetails,
    this.ads,
  });

  int? adCatogaryId;
  String? adCatogaryName;
  String? createdAt;
  String? updatedAt;
  List<CatogaryDetail>? catogaryDetails;
  List<dynamic>? ads;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        adCatogaryId: json["ad_catogary_id"],
        adCatogaryName: json["ad_catogary_name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        catogaryDetails: List<CatogaryDetail>.from(
            json["catogary_details"].map((x) => CatogaryDetail.fromJson(x))),
        ads: List<dynamic>.from(json["ads"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ad_catogary_id": adCatogaryId,
        "ad_catogary_name": adCatogaryName,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "catogary_details":
            List<dynamic>.from(catogaryDetails!.map((x) => x.toJson())),
        "ads": List<dynamic>.from(ads!.map((x) => x)),
      };
}

class CatogaryDetail {
  CatogaryDetail({
    this.catogaryDetailsId,
    this.catogaryName,
    this.picture,
    this.adId,
    this.adCatogaryId,
    this.createdAt,
    this.updatedAt,
  });

  int? catogaryDetailsId;
  String? catogaryName;
  String? picture;
  int? adId;
  int? adCatogaryId;
  String? createdAt;
  String? updatedAt;

  factory CatogaryDetail.fromJson(Map<String, dynamic> json) => CatogaryDetail(
        catogaryDetailsId: json["catogary_details_id"],
        catogaryName: json["catogary_name"],
        picture: json["picture"],
        adId: json["ad_id"],
        adCatogaryId: json["ad_catogary_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "catogary_details_id": catogaryDetailsId,
        "catogary_name": catogaryName,
        "picture": picture,
        "ad_id": adId,
        "ad_catogary_id": adCatogaryId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class AdsHomeModel {
  AdsHomeModel({
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

  factory AdsHomeModel.fromJson(Map<String, dynamic> json) => AdsHomeModel(
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
