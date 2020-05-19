// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

Transaction transactionFromJson(String str) => Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
  String id;
  String establishment;
  DateTime date;
  String userEmail;
  String transaction;
  int totalPoints;
  int v;
  Stablishments stablishments;
  String transactionId;

  Transaction({
    this.id,
    this.establishment,
    this.date,
    this.userEmail,
    this.transaction,
    this.totalPoints,
    this.v,
    this.stablishments,
    this.transactionId,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["_id"],
    establishment: json["establishment"],
    date: DateTime.parse(json["date"]),
    userEmail: json["user_email"],
    transaction: json["transaction"],
    totalPoints: json["total_points"],
    v: json["__v"],
    stablishments: Stablishments.fromJson(json["stablishments"]),
    transactionId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "establishment": establishment,
    "date": date.toIso8601String(),
    "user_email": userEmail,
    "transaction": transaction,
    "total_points": totalPoints,
    "__v": v,
    "stablishments": stablishments.toJson(),
    "id": transactionId,
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
