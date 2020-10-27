// To parse this JSON data, do
//
//     final blogMainCategoires = blogMainCategoiresFromJson(jsonString);

import 'dart:convert';

BlogMainCategoires blogMainCategoiresFromJson(String str) => BlogMainCategoires.fromJson(json.decode(str));

String blogMainCategoiresToJson(BlogMainCategoires data) => json.encode(data.toJson());

class BlogMainCategoires {
  BlogMainCategoires({
    this.status,
    this.message,
    this.response,
    this.other,
  });

  String status;
  String message;
  List<Response> response;
  dynamic other;

  factory BlogMainCategoires.fromJson(Map<String, dynamic> json) => BlogMainCategoires(
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
    this.image,
    this.archive,
  });

  String autoId;
  String name;
  String image;
  String archive;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    autoId: json["auto_id"] == null ? null : json["auto_id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    archive: json["archive"] == null ? null : json["archive"],
  );

  Map<String, dynamic> toJson() => {
    "auto_id": autoId == null ? null : autoId,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "archive": archive == null ? null : archive,
  };
}
