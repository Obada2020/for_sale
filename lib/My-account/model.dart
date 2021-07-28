// // To parse this JSON data, do
// //
// //     final myAccount = myAccountFromJson(jsonString);

// import 'dart:convert';

// MyAccount myAccountFromJson(String str) => MyAccount.fromJson(json.decode(str));

// String myAccountToJson(MyAccount data) => json.encode(data.toJson());

// class MyAccount {
//   MyAccount({
//     this.accountId,
//     this.accountPhoneNumber,
//     this.serialNumber,
//     this.eMail,
//     this.password,
//     this.accountTypeId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? accountId;
//   int? accountPhoneNumber;
//   int? serialNumber;
//   String? eMail;
//   String? password;
//   int? accountTypeId;
//   dynamic createdAt;
//   dynamic updatedAt;

//   factory MyAccount.fromJson(Map<String, dynamic> json) => MyAccount(
//         accountId: json["account_id"],
//         accountPhoneNumber: json["account_phone_number"],
//         serialNumber: json["serial_number"],
//         eMail: json["e_mail"],
//         password: json["password"],
//         accountTypeId: json["account_type_id"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "account_id": accountId,
//         "account_phone_number": accountPhoneNumber,
//         "serial_number": serialNumber,
//         "e_mail": eMail,
//         "password": password,
//         "account_type_id": accountTypeId,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }
