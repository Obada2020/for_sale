class AddName {
  int adCatogaryId;
  String adCatogaryName;
  String? createdAt;
  String? updatedAt;

  AddName(
      {required this.adCatogaryId,
      required this.adCatogaryName,
      required this.createdAt,
      required this.updatedAt});

  factory AddName.fromJson(Map<String, dynamic> json) {
    return AddName(
        adCatogaryId: json['ad_catogary_id'] ?? json['ad_catogary_id'],
        adCatogaryName: json['ad_catogary_name'] ?? json['ad_catogary_name'],
        createdAt: json['created_at'] ?? json['created_at'],
        updatedAt: json['updated_at'] ?? json['updated_at']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_catogary_id'] = this.adCatogaryId;
    data['ad_catogary_name'] = this.adCatogaryName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

//========================================================================================================================
class AddCat1 {
  List<Catogary>? list;
  String? isTheLast;
  // AddCat1();

  AddCat1({this.list, this.isTheLast});

  AddCat1.fromJson(Map<String, dynamic> json) {
    if (json['0'] != null) {
      list = <Catogary>[];
      json['0'].forEach((v) {
        list!.add(new Catogary.fromJson(v));
      });
    }
    isTheLast = json['isTheLast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['0'] = this.list!.map((v) => v.toJson()).toList();
    }
    data['isTheLast'] = this.isTheLast;
    return data;
  }
}

class Catogary {
  int? catogaryDetailsId;
  String? catogaryName;
  String? picture;
  int? adId;
  int? adCatogaryId;
  String? createdAt;
  String? updatedAt;

  Catogary(
      {this.catogaryDetailsId,
      this.catogaryName,
      this.picture,
      this.adId,
      this.adCatogaryId,
      this.createdAt,
      this.updatedAt});

  Catogary.fromJson(Map<String, dynamic> json) {
    catogaryDetailsId = json['catogary_details_id'];
    catogaryName = json['catogary_name'];
    picture = json['picture'];
    adId = json['ad_id'];
    adCatogaryId = json['ad_catogary_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catogary_details_id'] = this.catogaryDetailsId;
    data['catogary_name'] = this.catogaryName;
    data['picture'] = this.picture;
    data['ad_id'] = this.adId;
    data['ad_catogary_id'] = this.adCatogaryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

//************************************************************************************************************* */
class AdDescriptions {
  List<Addescription>? list;
  String? isTheLast;

  AdDescriptions({this.list, this.isTheLast});

  AdDescriptions.fromJson(Map<String, dynamic> json) {
    if (json['0'] != null) {
      list = <Addescription>[];
      json['0'].forEach((v) {
        list!.add(new Addescription.fromJson(v));
      });
    }
    isTheLast = json['isTheLast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['0'] = this.list!.map((v) => v.toJson()).toList();
    }
    data['isTheLast'] = this.isTheLast;
    return data;
  }
}

class Addescription {
  int? adDescriptionsId;
  String? adDetailsDescription;
  String? picture;
  int? adId;
  int? adCatogaryId;
  int? catogaryDetailsId;
  String? createdAt;
  String? updatedAt;

  Addescription(
      {this.adDescriptionsId,
      this.adDetailsDescription,
      this.picture,
      this.adId,
      this.adCatogaryId,
      this.catogaryDetailsId,
      this.createdAt,
      this.updatedAt});

  Addescription.fromJson(Map<String, dynamic> json) {
    adDescriptionsId = json['ad_descriptions_id'];
    adDetailsDescription = json['ad_details_description'];
    picture = json['picture'];
    adId = json['ad_id'];
    adCatogaryId = json['ad_catogary_id'];
    catogaryDetailsId = json['catogary_details_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_descriptions_id'] = this.adDescriptionsId;
    data['ad_details_description'] = this.adDetailsDescription;
    data['picture'] = this.picture;
    data['ad_id'] = this.adId;
    data['ad_catogary_id'] = this.adCatogaryId;
    data['catogary_details_id'] = this.catogaryDetailsId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

//****************************************************************************************************************** */
//****************************************************************************************************************** */
class LastAdd {
  List<LastCatogary>? list;
  String? isTheLast;
  // AddCat1();

  LastAdd({this.list, this.isTheLast});

  LastAdd.fromJson(Map<String, dynamic> json) {
    if (json['0'] != null) {
      list = <LastCatogary>[];
      json['0'].forEach((v) {
        list!.add(new LastCatogary.fromJson(v));
      });
    }
    isTheLast = json['isTheLast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['0'] = this.list!.map((v) => v.toJson()).toList();
    }
    data['isTheLast'] = this.isTheLast;
    return data;
  }
}

class LastCatogary {
  int? adTypeNameId;
  String? adTypeName;
  int? adId;
  int? adCatogaryId;
  int? catogaryDetailsId;
  int? adDescriptionsId;
  String? createdAt;
  String? updatedAt;

  LastCatogary(
      {this.adTypeNameId,
      this.adTypeName,
      this.adId,
      this.adCatogaryId,
      this.catogaryDetailsId,
      this.adDescriptionsId,
      this.createdAt,
      this.updatedAt});

  LastCatogary.fromJson(Map<String, dynamic> json) {
    adTypeNameId = json['ad_type_name_id'];
    adTypeName = json['ad_type_name'];
    adId = json['ad_id'];
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
    data['ad_id'] = this.adId;
    data['ad_catogary_id'] = this.adCatogaryId;
    data['catogary_details_id'] = this.catogaryDetailsId;
    data['ad_descriptions_id'] = this.adDescriptionsId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

//*************************************************************************************************************** */
class AdInfoKey {
  int? adInfoId;
  String? adInfo;
  int? adCatogaryId;
  String? createdAt;
  String? updatedAt;

  AdInfoKey({
    this.adInfoId,
    this.adInfo,
    this.adCatogaryId,
    this.createdAt,
    this.updatedAt,
  });

  AdInfoKey.fromJson(Map<String, dynamic> json) {
    adInfoId = json['ad_info_id'];
    adInfo = json['ad_info'];
    adCatogaryId = json['ad_catogary_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_info_id'] = this.adInfoId;
    data['ad_info'] = this.adInfo;
    data['ad_catogary_id'] = this.adCatogaryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class MyAdTypeModel {
  int? adTypeId;
  String? adTypeName;
  int? adTime;
  int? adCount;
  int? isSpecial;
  int? accountId;
  String? createdAt;
  String? updatedAt;

  MyAdTypeModel(
      {this.adTypeId,
      this.adTypeName,
      this.adTime,
      this.adCount,
      this.isSpecial,
      this.accountId,
      this.createdAt,
      this.updatedAt});

  MyAdTypeModel.fromJson(Map<String, dynamic> json) {
    adTypeId = json['ad_type_id'];
    adTypeName = json['ad_type_name'];
    adTime = json['ad_time'];
    adCount = json['ad_count'];
    isSpecial = json['is_special'];
    accountId = json['account_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_type_id'] = this.adTypeId;
    data['ad_type_name'] = this.adTypeName;
    data['ad_time'] = this.adTime;
    data['ad_count'] = this.adCount;
    data['is_special'] = this.isSpecial;
    data['account_id'] = this.accountId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class MyAdTypeModels {
  List<MyAdTypeModel> list = <MyAdTypeModel>[];
}
