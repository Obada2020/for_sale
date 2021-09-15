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

// class AdsHomeModel {
//   AdsHomeModel({
//     this.adId,
//     this.adName,
//     this.adPhoneNumber,
//     this.adDescription,
//     this.adPicture,
//     this.mangerAccept,
//     this.adPrice,
//     this.adInfo,
//     this.accountId,
//     this.adTypeId,
//     this.adCatogaryId,
//     this.catogaryDetailsId,
//     this.adDescriptionsId,
//     this.adTypeNameId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? adId;
//   String? adName;
//   String? adPhoneNumber;
//   String? adDescription;
//   String? adPicture;
//   int? mangerAccept;
//   int? adPrice;
//   String? adInfo;
//   int? accountId;
//   int? adTypeId;
//   int? adCatogaryId;
//   int? catogaryDetailsId;
//   int? adDescriptionsId;
//   int? adTypeNameId;
//   String? createdAt;
//   String? updatedAt;

//   factory AdsHomeModel.fromJson(Map<String, dynamic> json) => AdsHomeModel(
//         adId: json["ad_id"],
//         adName: json["ad_name"],
//         adPhoneNumber: json["ad_phone_number"],
//         adDescription: json["ad_description"],
//         adPicture: json["ad_picture"],
//         mangerAccept: json["manger_accept"],
//         adPrice: json["ad_price"],
//         adInfo: json["ad_info"],
//         accountId: json["account_id"],
//         adTypeId: json["ad_type_id"],
//         adCatogaryId: json["ad_catogary_id"],
//         catogaryDetailsId: json["catogary_details_id"],
//         adDescriptionsId: json["ad_descriptions_id"],
//         adTypeNameId: json["ad_type_name_id"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "ad_id": adId,
//         "ad_name": adName,
//         "ad_phone_number": adPhoneNumber,
//         "ad_description": adDescription,
//         "ad_picture": adPicture,
//         "manger_accept": mangerAccept,
//         "ad_price": adPrice,
//         "ad_info": adInfo,
//         "account_id": accountId,
//         "ad_type_id": adTypeId,
//         "ad_catogary_id": adCatogaryId,
//         "catogary_details_id": catogaryDetailsId,
//         "ad_descriptions_id": adDescriptionsId,
//         "ad_type_name_id": adTypeNameId,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }

class AdsHomeModel {
  //
  int? adId;
  String? adName;
  String? adPhoneNumber;
  String? adDescription;
  String? adPicture;
  int? mangerAccept;
  int? adPrice;
  String? adInfo;
  int? accountId;
  int? adTypeId;
  int? adCatogaryId;
  int? catogaryDetailsId;
  int? adDescriptionsId;
  int? adTypeNameId;
  int? isSpecial;
  String? createdAt;
  String? updatedAt;
  Adtypename? adtypename;
  List<Adpicture>? adpicture;

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
    this.isSpecial,
    this.createdAt,
    this.updatedAt,
    this.adtypename,
    this.adpicture,
  });

  AdsHomeModel.fromJson(Map<String, dynamic> json) {
    adId = json['ad_id'];
    adName = json['ad_name'];
    adPhoneNumber = json['ad_phone_number'];
    adDescription = json['ad_description'];
    adPicture = json['ad_picture'];
    mangerAccept = json['manger_accept'];
    adPrice = json['ad_price'];
    adInfo = json['ad_info'];
    accountId = json['account_id'];
    adTypeId = json['ad_type_id'];
    adCatogaryId = json['ad_catogary_id'];
    catogaryDetailsId = json['catogary_details_id'];
    adDescriptionsId = json['ad_descriptions_id'];
    adTypeNameId = json['ad_type_name_id'];
    isSpecial = json['is_special'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adtypename = json['adtypename'] != null
        ? new Adtypename.fromJson(json['adtypename'])
        : null;
    if (json['adpicture'] != null) {
      adpicture = <Adpicture>[];
      json['adpicture'].forEach((v) {
        adpicture!.add(new Adpicture.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_id'] = this.adId;
    data['ad_name'] = this.adName;
    data['ad_phone_number'] = this.adPhoneNumber;
    data['ad_description'] = this.adDescription;
    data['ad_picture'] = this.adPicture;
    data['manger_accept'] = this.mangerAccept;
    data['ad_price'] = this.adPrice;
    data['ad_info'] = this.adInfo;
    data['account_id'] = this.accountId;
    data['ad_type_id'] = this.adTypeId;
    data['ad_catogary_id'] = this.adCatogaryId;
    data['catogary_details_id'] = this.catogaryDetailsId;
    data['ad_descriptions_id'] = this.adDescriptionsId;
    data['ad_type_name_id'] = this.adTypeNameId;
    data['is_special'] = this.isSpecial;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.adtypename != null) {
      data['adtypename'] = this.adtypename!.toJson();
    }
    if (this.adpicture != null) {
      data['adpicture'] = this.adpicture!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Adtypename {
  int? adTypeNameId;
  String? adTypeName;
  int? adCatogaryId;
  int? catogaryDetailsId;
  int? adDescriptionsId;
  String? createdAt;
  String? updatedAt;

  Adtypename(
      {this.adTypeNameId,
      this.adTypeName,
      this.adCatogaryId,
      this.catogaryDetailsId,
      this.adDescriptionsId,
      this.createdAt,
      this.updatedAt});

  Adtypename.fromJson(Map<String, dynamic> json) {
    adTypeNameId = json['ad_type_name_id'];
    adTypeName = json['ad_type_name'];
    adCatogaryId = json['ad_catogary_id'];
    catogaryDetailsId = json['catogary_details_id'];
    adDescriptionsId = json['ad_descriptions_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_type_name_id'] = this.adTypeNameId;
    data['ad_type_name'] = this.adTypeName;
    data['ad_catogary_id'] = this.adCatogaryId;
    data['catogary_details_id'] = this.catogaryDetailsId;
    data['ad_descriptions_id'] = this.adDescriptionsId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Adpicture {
  int? adPicturesId;
  String? adPicture;
  int? adId;
  String? createdAt;
  String? updatedAt;

  Adpicture(
      {this.adPicturesId,
      this.adPicture,
      this.adId,
      this.createdAt,
      this.updatedAt});

  Adpicture.fromJson(Map<String, dynamic> json) {
    adPicturesId = json['ad_pictures_id'];
    adPicture = json['ad_picture'];
    adId = json['ad_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_pictures_id'] = this.adPicturesId;
    data['ad_picture'] = this.adPicture;
    data['ad_id'] = this.adId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
