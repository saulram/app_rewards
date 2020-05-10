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

  Transaction({
    this.id,
    this.establishment,
    this.date,
    this.userEmail,
    this.transaction,
    this.totalPoints,
    this.v,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["_id"],
    establishment: json["establishment"],
    date: DateTime.parse(json["date"]),
    userEmail: json["user_email"],
    transaction: json["transaction"],
    totalPoints: json["total_points"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "establishment": establishment,
    "date": date.toIso8601String(),
    "user_email": userEmail,
    "transaction": transaction,
    "total_points": totalPoints,
    "__v": v,
  };
}
