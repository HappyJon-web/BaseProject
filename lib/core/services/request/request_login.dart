import 'dart:convert';

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String username;
  String password;

  LoginRequest({this.username, this.password});

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
