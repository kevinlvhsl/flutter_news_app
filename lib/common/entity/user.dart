import 'package:flutter/foundation.dart';
// 登录
class UserLoginRequestEntity {
    String email;
    String password;

    UserLoginRequestEntity({
      @required this.email,
      @required this.password,
    });

    factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) => UserLoginRequestEntity(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}

// 登录响应
class UserLoginResponseEntity {
    @required String accessToken;
    String displayName;
    List<String> chanels;

    UserLoginResponseEntity({
        this.accessToken,
        this.displayName,
        this.chanels,
    });

    factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) => UserLoginResponseEntity(
        accessToken: json["accessToken"],
        displayName: json["displayName"],
        chanels: List<String>.from(json["chanels"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "displayName": displayName,
        "chanels": List<dynamic>.from(chanels.map((x) => x)),
    };
}
