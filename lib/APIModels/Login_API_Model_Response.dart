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
  dynamic other;

  factory LoginApiModel.fromJson(Map<String, dynamic> json) => LoginApiModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    response: json["response"] == null ? null : json["response"],
    other: json["other"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "response": response == null ? null : response,
    "other": other,
  };
}
