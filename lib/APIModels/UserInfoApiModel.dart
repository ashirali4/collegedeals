// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.status,
    this.message,
    this.response,
    this.other,
  });

  String status;
  String message;
  List<Response> response;
  dynamic other;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    response: json["response"] == null ? null : List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    other: json["other"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "response": response == null ? null : List<dynamic>.from(response.map((x) => x.toJson())),
    "other": other,
  };
}

class Response {
  Response({
    this.autoId,
    this.fullName,
    this.emailAddress,
    this.mobileNumber,
    this.institutionFullName,
    this.countryName,
    this.townCity,
    this.state,
  });

  String autoId;
  String fullName;
  String emailAddress;
  String mobileNumber;
  String institutionFullName;
  String countryName;
  String townCity;
  String state;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    autoId: json["auto_id"] == null ? null : json["auto_id"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    emailAddress: json["email_address"] == null ? null : json["email_address"],
    mobileNumber: json["mobile_number"] == null ? null : json["mobile_number"],
    institutionFullName: json["institution_full_name"] == null ? null : json["institution_full_name"],
    countryName: json["country_name"] == null ? null : json["country_name"],
    townCity: json["town_city"] == null ? null : json["town_city"],
    state: json["state"] == null ? null : json["state"],
  );

  Map<String, dynamic> toJson() => {
    "auto_id": autoId == null ? null : autoId,
    "full_name": fullName == null ? null : fullName,
    "email_address": emailAddress == null ? null : emailAddress,
    "mobile_number": mobileNumber == null ? null : mobileNumber,
    "institution_full_name": institutionFullName == null ? null : institutionFullName,
    "country_name": countryName == null ? null : countryName,
    "town_city": townCity == null ? null : townCity,
    "state": state == null ? null : state,
  };
}
