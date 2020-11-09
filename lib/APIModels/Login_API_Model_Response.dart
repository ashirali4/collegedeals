// To parse this JSON data, do
//
//     final loginApiModel = loginApiModelFromJson(jsonString);

import 'dart:convert';

LoginApiModel loginApiModelFromJson(String str) => LoginApiModel.fromJson(json.decode(str));

String loginApiModelToJson(LoginApiModel data) => json.encode(data.toJson());

class LoginApiModel {
  LoginApiModel({
    this.status,
    this.message,
    this.response,
    this.other,
  });

  String status;
  String message;
  String response;
  List<Other> other;

  factory LoginApiModel.fromJson(Map<String, dynamic> json) => LoginApiModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    response: json["response"] == null ? null : json["response"],
    other: json["other"] == null ? null : List<Other>.from(json["other"].map((x) => Other.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "response": response == null ? null : response,
    "other": other == null ? null : List<dynamic>.from(other.map((x) => x.toJson())),
  };
}

class Other {
  Other({
    this.autoId,
    this.fullName,
    this.emailAddress,
    this.verified,
  });

  String autoId;
  String fullName;
  String emailAddress;
  String verified;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    autoId: json["auto_id"] == null ? null : json["auto_id"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    emailAddress: json["email_address"] == null ? null : json["email_address"],
    verified: json["verified"] == null ? null : json["verified"],
  );

  Map<String, dynamic> toJson() => {
    "auto_id": autoId == null ? null : autoId,
    "full_name": fullName == null ? null : fullName,
    "email_address": emailAddress == null ? null : emailAddress,
    "verified": verified == null ? null : verified,
  };
}
