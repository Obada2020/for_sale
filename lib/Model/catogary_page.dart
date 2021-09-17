class CategoryModel {
  //
  int? adDescriptionsId;
  String? adDetailsDescription;
  String? picture;
  int? adCatogaryId;
  int? catogaryDetailsId;
  String? createdAt;
  String? updatedAt;
  
  CategoryModel({
    this.adDescriptionsId,
    this.adDetailsDescription,
    this.picture,
    this.adCatogaryId,
    this.catogaryDetailsId,
    this.createdAt,
    this.updatedAt,
  });
  
  CategoryModel.fromJson(Map<String, dynamic> json) {
    adDescriptionsId = json['ad_descriptions_id'];
    adDetailsDescription = json['ad_details_description'];
    picture = json['picture'];
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
    data['ad_catogary_id'] = this.adCatogaryId;
    data['catogary_details_id'] = this.catogaryDetailsId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
