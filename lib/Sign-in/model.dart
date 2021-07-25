class User {
  Info? info = Info();
  String? token;

  User({this.info, this.token});

  User.fromJson(Map<String, dynamic> json) {
    info = new Info.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['user'] = this.info!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Info {
  dynamic accountId;
  dynamic accountPhoneNumber;
  dynamic serialNumber;
  dynamic eMail;
  dynamic password;
  dynamic accountTypeId;
  dynamic createdAt;
  dynamic updatedAt;
  List<dynamic>? adtype;

  Info({
    this.accountId,
    this.accountPhoneNumber,
    this.serialNumber,
    this.eMail,
    this.password,
    this.accountTypeId,
    this.createdAt,
    this.updatedAt,
    this.adtype,
  });

  Info.fromJson(Map<String, dynamic> json) {
    adtype = [];
    accountId = json['account_id'];
    accountPhoneNumber = json['account_phone_number'];
    serialNumber = json['serial_number'];
    eMail = json['e_mail'];
    password = json['password'];
    accountTypeId = json['account_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    json['adtype'].forEach((v) {
      adtype!.add(new InfoAdd.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    adtype = [];
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['account_phone_number'] = this.accountPhoneNumber;
    data['serial_number'] = this.serialNumber;
    data['e_mail'] = this.eMail;
    data['password'] = this.password;
    data['account_type_id'] = this.accountTypeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['adtype'] = this.adtype!.map((v) => v.toJson()).toList();
    return data;
  }
}

class InfoAdd {
  dynamic adTypeId;
  dynamic adTypeName;
  dynamic adTime;
  dynamic adCount;
  dynamic accountId;
  dynamic createdAt;
  dynamic updatedAt;

  InfoAdd({
    this.adTypeId,
    this.adTypeName,
    this.adTime,
    this.adCount,
    this.accountId,
    this.createdAt,
    this.updatedAt,
  });

  InfoAdd.fromJson(Map<String, dynamic> json) {
    adTypeId = json['ad_type_id'];
    adTypeName = json['ad_type_name'];
    adTime = json['ad_time'];
    adCount = json['ad_count'];
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
    data['account_id'] = this.accountId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
