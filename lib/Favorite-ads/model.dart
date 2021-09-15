import 'package:for_sale/Home/model.dart';

class FavoriteModel {
  int? favoriteId;
  int? accountId;
  int? adId;
  String? createdAt;
  String? updatedAt;
  List<Ad?>? ad;
  List<Adpicture>? adpicture;

  FavoriteModel(
      {this.favoriteId,
      this.accountId,
      this.adId,
      this.createdAt,
      this.updatedAt,
      this.ad,
      this.adpicture});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    accountId = json['account_id'];
    adId = json['ad_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ad'] != null) {
      ad = <Ad>[];
      json['ad'].forEach((v) {
        ad!.add(new Ad.fromJson(v));
      });
    }
    if (json['adpicture'] != null) {
      adpicture = <Adpicture>[];
      json['adpicture'].forEach((v) {
        adpicture!.add(new Adpicture.fromJson(v));
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
      data['ad'] = this.ad!.map((v) => v!.toJson()).toList();
    }
    if (this.adpicture != null) {
      data['adpicture'] = this.adpicture!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ad {
  int? adId;
  String? adName;
  String? adPhoneNumber;
  String? adDescription;
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

  Ad(
      {this.adId,
      this.adName,
      this.adPhoneNumber,
      this.adDescription,
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
      this.updatedAt});

  Ad.fromJson(Map<String, dynamic> json) {
    adId = json['ad_id'];
    adName = json['ad_name'];
    adPhoneNumber = json['ad_phone_number'];
    adDescription = json['ad_description'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_id'] = this.adId;
    data['ad_name'] = this.adName;
    data['ad_phone_number'] = this.adPhoneNumber;
    data['ad_description'] = this.adDescription;
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
    return data;
  }
}

// class Adpicture {
//   int? adPicturesId;
//   String? adPicture;
//   int? adId;
//   String? createdAt;
//   String ?updatedAt;

//   Adpicture(
//       {this.adPicturesId,
//       this.adPicture,
//       this.adId,
//       this.createdAt,
//       this.updatedAt});

//   Adpicture.fromJson(Map<String, dynamic> json) {
//     adPicturesId = json['ad_pictures_id'];
//     adPicture = json['ad_picture'];
//     adId = json['ad_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ad_pictures_id'] = this.adPicturesId;
//     data['ad_picture'] = this.adPicture;
//     data['ad_id'] = this.adId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }



// class FavoriteModel {
//   int? favoriteId;
//   int? accountId;
//   int? adId;w
//   String? createdAt;
//   String? updatedAt;
//   List<AdsHomeModel>? ad;
//   List<Adpicture>? adpicture;

//   FavoriteModel(
//       {this.favoriteId,
//       this.accountId,
//       this.adId,
//       this.createdAt,
//       this.updatedAt,
//       this.ad,
//       this.adpicture});

//   FavoriteModel.fromJson(Map<String, dynamic> json) {
//     favoriteId = json['favorite_id'];
//     accountId = json['account_id'];
//     adId = json['ad_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['ad'] != null) {
//       ad = <AdsHomeModel>[];
//       json['ad'].forEach((v) {
//         ad!.add(new AdsHomeModel.fromJson(v));
//       });
//     }
//     if (json['adpicture'] != null) {
//       adpicture = <Adpicture>[];
//       json['adpicture'].forEach((v) {
//         adpicture!.add(new Adpicture.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['favorite_id'] = this.favoriteId;
//     data['account_id'] = this.accountId;
//     data['ad_id'] = this.adId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.ad != null) {
//       data['ad'] = this.ad!.map((v) => v.toJson()).toList();
//     }
//     if (this.adpicture != null) {
//       data['adpicture'] = this.adpicture!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }







// class FavoriteModel {
//   //
//   FavoriteModel({
//     this.favoriteId,
//     this.accountId,
//     this.adId,
//     this.createdAt,
//     this.updatedAt,
//     this.ad,
//   });
//   //
//   int? favoriteId;
//   int? accountId;
//   int? adId;
//   String? createdAt;
//   String? updatedAt;
//   List<AdsHomeModel>? ad;
//   //
//   factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
//         favoriteId: json["favorite_id"],
//         accountId: json["account_id"],
//         adId: json["ad_id"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         ad: List<AdsHomeModel>.from(
//             json["ad"].map((x) => AdsHomeModel.fromJson(x))),
//       );
//   //
//   Map<String, dynamic> toJson() => {
//         "favorite_id": favoriteId,
//         "account_id": accountId,
//         "ad_id": adId,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "ad": List<dynamic>.from(ad!.map((x) => x.toJson())),
//       };
// }

// class Ad {
//   Ad({
//     this.adId,
//     this.adname,
//     this.adPhoneNumber,
//     this.adDescription,
//     this.adPicture,
//     this.mangerAccept,
//     this.adPrice,
//     this.adCatogaryId,
//     this.accountId,
//     this.adTypeId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? adId;
//   String? adname;
//   String? adPhoneNumber;
//   String? adDescription;
//   String? adPicture;
//   int? mangerAccept;
//   int? adPrice;
//   int? adCatogaryId;
//   int? accountId;
//   int? adTypeId;
//   String? createdAt;
//   String? updatedAt;

//   factory Ad.fromJson(Map<String, dynamic> json) => Ad(
//         adId: json["ad_id"],
//         adname: json['ad_name'],
//         adPhoneNumber: json["ad_phone_number"],
//         adDescription: json["ad_description"],
//         adPicture: json["ad_picture"],
//         mangerAccept: json["manger_accept"],
//         adPrice: json["ad_price"],
//         adCatogaryId: json["ad_catogary_id"],
//         accountId: json["account_id"],
//         adTypeId: json["ad_type_id"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "ad_id": adId,
//         "|ad_name": adname,
//         "ad_phone_number": adPhoneNumber,
//         "ad_description": adDescription,
//         "ad_picture": adPicture,
//         "manger_accept": mangerAccept,
//         "ad_price": adPrice,
//         "ad_catogary_id": adCatogaryId,
//         "account_id": accountId,
//         "ad_type_id": adTypeId,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }
