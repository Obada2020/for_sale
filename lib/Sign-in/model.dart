import 'dart:convert';

SigninModel signinModelFromJson(String str) =>
    SigninModel.fromJson(json.decode(str));

String signinModelToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
  SigninModel({
    this.accountPhoneNumber,
    this.accountTypeId,
  });

  String? accountPhoneNumber;
  int? accountTypeId;

  factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
        accountPhoneNumber: json["account_phone_number"],
        accountTypeId: json["account_type_id"],
      );

  Map<String, dynamic> toJson() => {
        "account_phone_number": accountPhoneNumber,
        "account_type_id": accountTypeId,
      };
}
