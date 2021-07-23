// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
    CategoryModel({
        this.adDescriptionsId,
        this.adDetailsDescription,
        this.picture,
        this.adCatogaryId,
        this.catogaryDetailsId,
    });

    int? adDescriptionsId;
    String? adDetailsDescription;
    String? picture;
    int? adCatogaryId;
    int? catogaryDetailsId;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        adDescriptionsId: json["ad_descriptions_id"],
        adDetailsDescription: json["ad_details_description"],
        picture: json["picture"],
        adCatogaryId: json["ad_catogary_id"],
        catogaryDetailsId: json["catogary_details_id"],
    );

    Map<String, dynamic> toJson() => {
        "ad_descriptions_id": adDescriptionsId,
        "ad_details_description": adDetailsDescription,
        "picture": picture,
        "ad_catogary_id": adCatogaryId,
        "catogary_details_id": catogaryDetailsId,
    };
}
