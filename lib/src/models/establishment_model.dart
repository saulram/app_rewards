// To parse this JSON data, do
//
//     final establishment = establishmentFromJson(jsonString);

import 'dart:convert';

Establishment establishmentFromJson(String str) => Establishment.fromJson(json.decode(str));

String establishmentToJson(Establishment data) => json.encode(data.toJson());

class Establishment {
  String id;
  String name;
  String description;
  String categories;
  String location;
  String url;
  String image;
  int v;

  Establishment({
    this.id,
    this.name,
    this.description,
    this.categories,
    this.location,
    this.url,
    this.image,
    this.v,
  });

  factory Establishment.fromJson(Map<String, dynamic> json) => Establishment(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    categories: json["categories"],
    location: json["location"],
    url: json["url"],
    image: json["image"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "categories": categories,
    "location": location,
    "url": url,
    "image": image,
    "__v": v,
  };
}
