// To parse this JSON data, do
//
//     final fetchBlogPost = fetchBlogPostFromJson(jsonString);

import 'dart:convert';

FetchBlogPost fetchBlogPostFromJson(String str) => FetchBlogPost.fromJson(json.decode(str));

String fetchBlogPostToJson(FetchBlogPost data) => json.encode(data.toJson());

class FetchBlogPost {
  FetchBlogPost({
    this.status,
    this.message,
    this.response,
    this.other,
  });

  String status;
  String message;
  List<Response> response;
  dynamic other;

  factory FetchBlogPost.fromJson(Map<String, dynamic> json) => FetchBlogPost(
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
    this.blogMainCat,
    this.postedBy,
    this.title,
    this.metaDescription,
    this.featuredImage,
    this.content,
    this.noOfLikes,
    this.views,
    this.postedDatetime,
    this.archive,
    this.addedOn,
  });

  String autoId;
  String blogMainCat;
  String postedBy;
  String title;
  String metaDescription;
  String featuredImage;
  String content;
  String noOfLikes;
  String views;
  String postedDatetime;
  String archive;
  String addedOn;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    autoId: json["auto_id"] == null ? null : json["auto_id"],
    blogMainCat: json["blog_main_cat"] == null ? null : json["blog_main_cat"],
    postedBy: json["posted_by"] == null ? null : json["posted_by"],
    title: json["title"] == null ? null : json["title"],
    metaDescription: json["meta_description"] == null ? null : json["meta_description"],
    featuredImage: json["featured_image"] == null ? null : json["featured_image"],
    content: json["content"] == null ? null : json["content"],
    noOfLikes: json["no_of_likes"] == null ? null : json["no_of_likes"],
    views: json["views"] == null ? null : json["views"],
    postedDatetime: json["posted_datetime"] == null ? null : json["posted_datetime"],
    archive: json["archive"] == null ? null : json["archive"],
    addedOn: json["added_on"] == null ? null : json["added_on"],
  );

  Map<String, dynamic> toJson() => {
    "auto_id": autoId == null ? null : autoId,
    "blog_main_cat": blogMainCat == null ? null : blogMainCat,
    "posted_by": postedBy == null ? null : postedBy,
    "title": title == null ? null : title,
    "meta_description": metaDescription == null ? null : metaDescription,
    "featured_image": featuredImage == null ? null : featuredImage,
    "content": content == null ? null : content,
    "no_of_likes": noOfLikes == null ? null : noOfLikes,
    "views": views == null ? null : views,
    "posted_datetime": postedDatetime == null ? null : postedDatetime,
    "archive": archive == null ? null : archive,
    "added_on": addedOn == null ? null : addedOn,
  };
}
