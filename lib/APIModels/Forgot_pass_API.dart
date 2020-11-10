// To parse this JSON data, do
//
//     final forgetpass = forgetpassFromJson(jsonString);

import 'dart:convert';

Forgetpass forgetpassFromJson(String str) => Forgetpass.fromJson(json.decode(str));

String forgetpassToJson(Forgetpass data) => json.encode(data.toJson());

class Forgetpass {
  Forgetpass({
    this.status,
    this.redirectUrl,
  });

  String status;
  String redirectUrl;

  factory Forgetpass.fromJson(Map<String, dynamic> json) => Forgetpass(
    status: json["status"] == null ? null : json["status"],
    redirectUrl: json["redirect_url"] == null ? null : json["redirect_url"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "redirect_url": redirectUrl == null ? null : redirectUrl,
  };
}
