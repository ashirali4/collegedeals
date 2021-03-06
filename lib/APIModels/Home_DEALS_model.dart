// To parse this JSON data, do
//
//     final fetchHomeDeals = fetchHomeDealsFromJson(jsonString);

import 'dart:convert';

FetchHomeDeals fetchHomeDealsFromJson(String str) => FetchHomeDeals.fromJson(json.decode(str));

String fetchHomeDealsToJson(FetchHomeDeals data) => json.encode(data.toJson());

class FetchHomeDeals {
  FetchHomeDeals({
    this.status,
    this.message,
    this.response,
    this.other,
  });

  int status;
  String message;
  List<Response> response;
  dynamic other;

  factory FetchHomeDeals.fromJson(Map<String, dynamic> json) => FetchHomeDeals(
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
    this.brandAutoId,
    this.linkOrCoupon,
    this.linkOrCouponValue,
    this.tagLine,
    this.description,
    this.orderNo,
    this.showOnHome,
    this.archive,
    this.brandImageName,
  });

  String autoId;
  String brandAutoId;
  String linkOrCoupon;
  String linkOrCouponValue;
  String tagLine;
  String description;
  String orderNo;
  String showOnHome;
  String archive;
  String brandImageName;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    autoId: json["auto_id"] == null ? null : json["auto_id"],
    brandAutoId: json["brand_auto_id"] == null ? null : json["brand_auto_id"],
    linkOrCoupon: json["link_or_coupon"] == null ? null : json["link_or_coupon"],
    linkOrCouponValue: json["link_or_coupon_value"] == null ? null : json["link_or_coupon_value"],
    tagLine: json["tag_line"] == null ? null : json["tag_line"],
    description: json["description"] == null ? null : json["description"],
    orderNo: json["order_no"] == null ? null : json["order_no"],
    showOnHome: json["show_on_home"] == null ? null : json["show_on_home"],
    archive: json["archive"] == null ? null : json["archive"],
    brandImageName: json["brand_image_name"] == null ? null : json["brand_image_name"],
  );

  Map<String, dynamic> toJson() => {
    "auto_id": autoId == null ? null : autoId,
    "brand_auto_id": brandAutoId == null ? null : brandAutoId,
    "link_or_coupon": linkOrCoupon == null ? null : linkOrCoupon,
    "link_or_coupon_value": linkOrCouponValue == null ? null : linkOrCouponValue,
    "tag_line": tagLine == null ? null : tagLine,
    "description": description == null ? null : description,
    "order_no": orderNo == null ? null : orderNo,
    "show_on_home": showOnHome == null ? null : showOnHome,
    "archive": archive == null ? null : archive,
    "brand_image_name": brandImageName == null ? null : brandImageName,
  };
}
