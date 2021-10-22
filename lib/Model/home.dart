class HomeModel {
  int? adCatogaryId;
  String? adCatogaryName;
  String? createdAt;
  String? updatedAt;
  List<CatogaryDetails>? catogaryDetails;
  List<Ads>? ads;

  HomeModel(
      {this.adCatogaryId,
      this.adCatogaryName,
      this.createdAt,
      this.updatedAt,
      this.catogaryDetails,
      this.ads});

  HomeModel.fromJson(Map<String, dynamic> json) {
    adCatogaryId = json['ad_catogary_id'];
    adCatogaryName = json['ad_catogary_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['catogary_details'] != null) {
      catogaryDetails = <CatogaryDetails>[];
      json['catogary_details'].forEach((v) {
        catogaryDetails!.add(new CatogaryDetails.fromJson(v));
      });
    }
    if (json['ads'] != null) {
      ads = <Ads>[];
      json['ads'].forEach((v) {
        ads!.add(new Ads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_catogary_id'] = this.adCatogaryId;
    data['ad_catogary_name'] = this.adCatogaryName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.catogaryDetails != null) {
      data['catogary_details'] =
          this.catogaryDetails!.map((v) => v.toJson()).toList();
    }
    if (this.ads != null) {
      data['ads'] = this.ads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class AdInfo {
//   String? ttt;
//   String? sss;

//   AdInfo({this.ttt, this.sss});

//   AdInfo.fromJson(Map<String, dynamic> json) {
//     ttt = json['ttt'];
//     sss = json['Sss'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ttt'] = this.ttt;
//     data['Sss'] = this.sss;
//     return data;
//   }
// }

class CatogaryDetails {
  int? catogaryDetailsId;
  String? catogaryName;
  String? picture;
  int? adCatogaryId;
  String? createdAt;
  String? updatedAt;

  CatogaryDetails(
      {this.catogaryDetailsId,
      this.catogaryName,
      this.picture,
      this.adCatogaryId,
      this.createdAt,
      this.updatedAt});

  CatogaryDetails.fromJson(Map<String, dynamic> json) {
    catogaryDetailsId = json['catogary_details_id'];
    catogaryName = json['catogary_name'];
    picture = json['picture'];
    adCatogaryId = json['ad_catogary_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catogary_details_id'] = this.catogaryDetailsId;
    data['catogary_name'] = this.catogaryName;
    data['picture'] = this.picture;
    data['ad_catogary_id'] = this.adCatogaryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Ads {
  int? adId;
  String? adName;
  String? adPhoneNumber;
  String? adDescription;
  int? mangerAccept;
  var adPrice;
  List<Map<String, dynamic>>? adInfo;
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
  //
  Ads(
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
      this.updatedAt,
      this.adtypename,
      this.adpicture});

  Ads.fromJson(Map<String, dynamic> json) {
    adId = json['ad_id'];
    adName = json['ad_name'];
    adPhoneNumber = json['ad_phone_number'];
    adDescription = json['ad_description'];
    mangerAccept = json['manger_accept'];
    adPrice = json['ad_price'];
    if (json['ad_info'] != null) {
      adInfo = [];
      json['ad_info'].forEach((v) {
        adInfo!.add(v);
      });
    }
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
