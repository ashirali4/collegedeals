// To parse this JSON data, do
//
//     final fetchbrandsfromsub = fetchbrandsfromsubFromJson(jsonString);

import 'dart:convert';

Fetchbrandsfromsub fetchbrandsfromsubFromJson(String str) => Fetchbrandsfromsub.fromJson(json.decode(str));

String fetchbrandsfromsubToJson(Fetchbrandsfromsub data) => json.encode(data.toJson());

class Fetchbrandsfromsub {
  Fetchbrandsfromsub({
    this.status,
    this.message,
    this.response,
    this.other,
  });

  int status;
  String message;
  List<Response> response;
  dynamic other;

  factory Fetchbrandsfromsub.fromJson(Map<String, dynamic> json) => Fetchbrandsfromsub(
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
    this.mainCatAutoId,
    this.subCatAutoId,
    this.brandAutoId,
    this.brandImageName,
    this.brandName,
  });

  String autoId;
  String mainCatAutoId;
  String subCatAutoId;
  String brandAutoId;
  String brandImageName;
  String brandName;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    autoId: json["auto_id"] == null ? null : json["auto_id"],
    mainCatAutoId: json["main_cat_auto_id"] == null ? null : json["main_cat_auto_id"],
    subCatAutoId: json["sub_cat_auto_id"] == null ? null : json["sub_cat_auto_id"],
    brandAutoId: json["brand_auto_id"] == null ? null : json["brand_auto_id"],
    brandImageName: json["brand_image_name"] == null ? null : json["brand_image_name"],
    brandName: json["brand_name"] == null ? null : json["brand_name"],
  );

  Map<String, dynamic> toJson() => {
    "auto_id": autoId == null ? null : autoId,
    "main_cat_auto_id": mainCatAutoId == null ? null : mainCatAutoId,
    "sub_cat_auto_id": subCatAutoId == null ? null : subCatAutoId,
    "brand_auto_id": brandAutoId == null ? null : brandAutoId,
    "brand_image_name": brandImageName == null ? null : brandImageName,
    "brand_name": brandName == null ? null : brandName,
  };
}
