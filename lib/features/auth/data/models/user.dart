class UserModel {
  UserModel({
      this.message, 
      this.user, 
      this.token,});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserModel? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

