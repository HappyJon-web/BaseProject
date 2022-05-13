import 'dart:convert';

String logoutRequestToJson(LogoutRequest data) => json.encode(data.toJson());

class LogoutRequest {
  String key;

  LogoutRequest({this.key});

  Map<String, dynamic> toJson() => {
        "key": key,
      };
}
