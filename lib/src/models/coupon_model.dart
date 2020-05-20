// To parse this JSON data, do
//
//     final coupon = couponFromJson(jsonString);

import 'dart:convert';

Coupon couponFromJson(String str) => Coupon.fromJson(json.decode(str));

String couponToJson(Coupon data) => json.encode(data.toJson());

class Coupon {
  String id;
  String establishment;
  DateTime date;
  String userEmail;
  String code;
  int amount;
  int status;
  int v;
  Stablishments stablishments;
  String couponId;

  Coupon({
    this.id,
    this.establishment,
    this.date,
    this.userEmail,
    this.code,
    this.amount,
    this.status,
    this.v,
    this.stablishments,
    this.couponId,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    id: json["_id"],
    establishment: json["establishment"],
    date: DateTime.parse(json["date"]),
    userEmail: json["user_email"],
    code: json["code"],
    amount: json["amount"],
    status: json["status"],
    v: json["__v"],
    stablishments: Stablishments.fromJson(json["stablishments"]),
    couponId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "establishment": establishment,
    "date": date.toIso8601String(),
    "user_email": userEmail,
    "code": code,
    "amount": amount,
    "status": status,
    "__v": v,
    "stablishments": stablishments.toJson(),
    "id": couponId,
  };
}

class Stablishments {
  String id;
  String name;
  String description;
  String categories;
  String location;
  String url;
  String image;
  int v;

  Stablishments({
    this.id,
    this.name,
    this.description,
    this.categories,
    this.location,
    this.url,
    this.image,
    this.v,
  });

  factory Stablishments.fromJson(Map<String, dynamic> json) => Stablishments(
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
