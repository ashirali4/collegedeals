// To parse this JSON data, do
//
//     final verifyemail = verifyemailFromJson(jsonString);

import 'dart:convert';

Verifyemail verifyemailFromJson(String str) => Verifyemail.fromJson(json.decode(str));

String verifyemailToJson(Verifyemail data) => json.encode(data.toJson());

class Verifyemail {
  Verifyemail({
    this.status,
  });

  String status;

  factory Verifyemail.fromJson(Map<String, dynamic> json) => Verifyemail(
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
  };
}
