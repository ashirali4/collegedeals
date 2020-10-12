// To parse this JSON data, do
//
//     final signupResponse = signupResponseFromJson(jsonString);

import 'dart:convert';

SignupResponse signupResponseFromJson(String str) => SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  SignupResponse({
    this.status,
    this.redirectUrl,
  });

  String status;
  String redirectUrl;

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
    status: json["status"] == null ? null : json["status"],
    redirectUrl: json["redirect_url"] == null ? null : json["redirect_url"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "redirect_url": redirectUrl == null ? null : redirectUrl,
  };
}
