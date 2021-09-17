class Message {
  int? messageId;
  String? message;
  int? isAdmin;
  int? accountId;
  String? createdAt;
  String? updatedAt;

  Message({
    this.messageId,
    this.message,
    this.isAdmin,
    this.accountId,
    this.createdAt,
    this.updatedAt,
  });

  Message.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'];
    message = json['message'];
    isAdmin = json['is_admin'];
    accountId = json['account_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_id'] = this.messageId;
    data['message'] = this.message;
    data['is_admin'] = this.isAdmin;
    data['account_id'] = this.accountId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
