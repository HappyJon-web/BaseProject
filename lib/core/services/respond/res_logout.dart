import 'dart:convert';

LogoutResponse logoutResponseFromJson(String str) =>
    LogoutResponse.fromJson(json.decode(str));

class LogoutResponse {
  LogoutResponse({
    this.status,
    this.message,
    this.data,
  });

  Data data;
  bool status;
  String message;
  factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
      status: json["success"] == null ? false : json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"] == null ? null : json["message"]);
}

class Data {
  Data({this.key});
  String key;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        key: json["key"] == null ? null : json["key"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
      };
}
