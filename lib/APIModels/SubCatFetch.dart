// To parse this JSON data, do
//
//     final subcatfetchapi = subcatfetchapiFromJson(jsonString);

import 'dart:convert';

List<Subcatfetchapi> subcatfetchapiFromJson(String str) => List<Subcatfetchapi>.from(json.decode(str).map((x) => Subcatfetchapi.fromJson(x)));

String subcatfetchapiToJson(List<Subcatfetchapi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subcatfetchapi {
  Subcatfetchapi({
    this.autoId,
    this.mainCatAutoId,
    this.name,
    this.image,
    this.orderNo,
    this.showOnHome,
    this.archive,
  });

  String autoId;
  String mainCatAutoId;
  String name;
  String image;
  String orderNo;
  String showOnHome;
  String archive;

  factory Subcatfetchapi.fromJson(Map<String, dynamic> json) => Subcatfetchapi(
    autoId: json["auto_id"] == null ? null : json["auto_id"],
    mainCatAutoId: json["main_cat_auto_id"] == null ? null : json["main_cat_auto_id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    orderNo: json["order_no"] == null ? null : json["order_no"],
    showOnHome: json["show_on_home"] == null ? null : json["show_on_home"],
    archive: json["archive"] == null ? null : json["archive"],
  );

  Map<String, dynamic> toJson() => {
    "auto_id": autoId == null ? null : autoId,
    "main_cat_auto_id": mainCatAutoId == null ? null : mainCatAutoId,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "order_no": orderNo == null ? null : orderNo,
    "show_on_home": showOnHome == null ? null : showOnHome,
    "archive": archive == null ? null : archive,
  };
}
