// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

import 'dart:convert';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel {
  ApiModel({
    this.category,
    this.data,
    this.success,
  });

  String category;
  List<Datum> data;
  bool success;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
    category: json["category"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
  };
}

class Datum {
  Datum({
    this.author,
    this.content,
    this.date,
    this.id,
    this.imageUrl,
    this.readMoreUrl,
    this.time,
    this.title,
    this.url,
  });

  String author;
  String content;
  String date;
  String id;
  String imageUrl;
  String readMoreUrl;
  String time;
  String title;
  String url;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    author: json["author"],
    content: json["content"],
    date: json["date"],
    id: json["id"],
    imageUrl: json["imageUrl"],
    readMoreUrl: json["readMoreUrl"] == null ? null : json["readMoreUrl"],
    time: json["time"],
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "content": content,
    "date": date,
    "id": id,
    "imageUrl": imageUrl,
    "readMoreUrl": readMoreUrl == null ? null : readMoreUrl,
    "time": time,
    "title": title,
    "url": url,
  };
}
