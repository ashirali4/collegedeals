// To parse this JSON data, do
//
//     final fashionPost = fashionPostFromJson(jsonString);

import 'dart:convert';

FashionPost fashionPostFromJson(String str) => FashionPost.fromJson(json.decode(str));

String fashionPostToJson(FashionPost data) => json.encode(data.toJson());

class FashionPost {
  FashionPost({
    this.status,
    this.message,
    this.response,
    this.other,
  });

  int status;
  String message;
  List<Response> response;
  dynamic other;

  factory FashionPost.fromJson(Map<String, dynamic> json) => FashionPost(
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
    this.name,
    this.websiteLink,
    this.tagLine,
    this.description,
    this.image,
    this.orderNo,
    this.archive,
  });

  String autoId;
  String name;
  String websiteLink;
  String tagLine;
  String description;
  String image;
  String orderNo;
  String archive;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    autoId: json["auto_id"] == null ? null : json["auto_id"],
    name: json["name"] == null ? null : json["name"],
    websiteLink: json["website_link"] == null ? null : json["website_link"],
    tagLine: json["tag_line"] == null ? null : json["tag_line"],
    description: json["description"] == null ? null : json["description"],
    image: json["image"] == null ? null : json["image"],
    orderNo: json["order_no"] == null ? null : json["order_no"],
    archive: json["archive"] == null ? null : json["archive"],
  );

  Map<String, dynamic> toJson() => {
    "auto_id": autoId == null ? null : autoId,
    "name": name == null ? null : name,
    "website_link": websiteLink == null ? null : websiteLink,
    "tag_line": tagLine == null ? null : tagLine,
    "description": description == null ? null : description,
    "image": image == null ? null : image,
    "order_no": orderNo == null ? null : orderNo,
    "archive": archive == null ? null : archive,
  };
}
