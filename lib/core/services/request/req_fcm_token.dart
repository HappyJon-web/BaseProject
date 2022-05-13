// To parse this JSON data, do
//
//     final fcmTokenRequest = fcmTokenRequestFromJson(jsonString);

import 'dart:convert';

FcmTokenRequest fcmTokenRequestFromJson(String str) =>
    FcmTokenRequest.fromJson(json.decode(str));

String fcmTokenRequestToJson(FcmTokenRequest data) =>
    json.encode(data.toJson());

class FcmTokenRequest {
  FcmTokenRequest({
    this.installationId,
    this.pushType,
    this.phoneType,
    this.appVersion,
  });

  String installationId;
  String pushType;
  String phoneType;
  String appVersion;

  factory FcmTokenRequest.fromJson(Map<String, dynamic> json) =>
      FcmTokenRequest(
        installationId:
            json["installation_id"] == null ? null : json["installation_id"],
        pushType: json["push_type"] == null ? null : json["push_type"],
        phoneType: json["phone_type"] == null ? null : json["phone_type"],
        appVersion: json["app_version"] == null ? null : json["app_version"],
      );

  Map<String, dynamic> toJson() => {
        "installation_id": installationId == null ? null : installationId,
        "push_type": pushType == null ? null : pushType,
        "phone_type": phoneType == null ? null : phoneType,
        "app_version": appVersion == null ? null : appVersion,
      };
}
