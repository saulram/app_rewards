import 'dart:convert';

import 'package:apprewards/src/models/transaction_model.dart';
import 'package:apprewards/src/models/user_model.dart';
import 'package:flutter/material.dart';
import '../utils/globals.dart';
import 'package:http/http.dart' as http;

class TransactionService with ChangeNotifier {
  User _user;
  bool _loadinTransactions = false;
  bool get loading =>_loadinTransactions;


  User get user => _user;
  String api = url_api;

  List<Transaction> userTransactions = [];

  void updateUser(User user) {
    _user = user;
    //esta accion se ejecuta al iniciar el servicio.
    getTransactions();
    notifyListeners();
  }
Future<void> refreshTransactions() async{
    getTransactions();
    notifyListeners();
}
  getTransactions() async {
    _loadinTransactions = true;

    var req = await http.get(
      '$api/user-transactions',
      headers: {'Authorization': _user.token, 'email': _user.user.email},
    );

    if (req.statusCode == 200) {
      userTransactions = [];
      var body = jsonDecode(req.body);

      for (int i = 0; i < body['listaDeTransacciones'].length; i++) {
        Transaction addtolist = transactionFromJson(
          jsonEncode(
            body['listaDeTransacciones'][i],
          ),
        );
        userTransactions.add(addtolist);

      }

      _loadinTransactions = false;
    }else{
      _loadinTransactions = false;
    }
    notifyListeners();
  }
}
