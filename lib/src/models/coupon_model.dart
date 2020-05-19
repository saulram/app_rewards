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

  Coupon({
    this.id,
    this.establishment,
    this.date,
    this.userEmail,
    this.code,
    this.amount,
    this.status,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    id: json["_id"],
    establishment: json["establishment"],
    date: DateTime.parse(json["date"]),
    userEmail: json["user_email"],
    code: json["code"],
    amount: json["amount"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "establishment": establishment,
    "date": date.toIso8601String(),
    "user_email": userEmail,
    "code": code,
    "amount": amount,
    "status": status,
  };
}
