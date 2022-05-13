import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.data,
  });

  Data data;
  bool status;
  String message;
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      status: json["success"] == null ? false : json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"] == null ? null : json["message"]);
}

class Data {
  Data({this.username, this.phone, this.token});

  String username;
  String phone;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "phone": phone == null ? null : phone,
        "token": token == null ? null : token,
      };
}
