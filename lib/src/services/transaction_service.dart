import 'dart:convert';

import 'package:apprewards/src/models/transaction_model.dart';
import 'package:apprewards/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import '../utils/globals.dart';
import 'package:http/http.dart' as http;

class TransactionService with ChangeNotifier {
  User _user = User();
  bool _loadinTransactions = false;
  bool _loadingTotalPoints = false;

  bool get loading => _loadinTransactions;
  int _numeroDePuntos = 0;
  double _pointsTochange = 0;

  double get pointsToChange => _pointsTochange;

  set pointsToChange(double newPoints) {
    _pointsTochange = newPoints;
    notifyListeners();
  }

  int _newTotal;

  int get newTotal => _newTotal;

  set newTotal(newTotal) {
    _newTotal = newTotal;
    notifyListeners();
  }

  String get formatedtotalPoints {
    var formated = NumberFormat('###,###,###.##');
    return formated.format(_numeroDePuntos);
  }
  int get totalPoints {
    return _numeroDePuntos;
  }

  User get user => _user;
  String api = url_api;

  List<Transaction> userTransactions = [];

  void updateUser(User user) {
    _user = user;
    //esta accion se ejecuta al iniciar el servicio.

    _pointsTochange = 0;
    _newTotal = null;

    getTransactions();
    notifyListeners();
  }

  Future<void> refreshTransactions() async {
    getTransactions();
    notifyListeners();
  }

  getTransactions() async {
    _numeroDePuntos = 0;
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
        _numeroDePuntos = _numeroDePuntos + addtolist.totalPoints;
        userTransactions.add(addtolist);
      }

      _loadinTransactions = false;
    } else {
      _loadinTransactions = false;
    }
    notifyListeners();
  }

  Future<bool> createTransactionCuponChanged(String url) async {
    _loadinTransactions = true;

    int discountedpts = _pointsTochange ~/ 1000;
    discountedpts = (discountedpts * -1).toInt();

    var req = await http.post(
      '$url_api/transaction',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': _user.token,
        'x-wc-webhook-source': url
      },
      body: jsonEncode(
        {
          'date_created': DateTime.now().toIso8601String(),
          'number': randomNumeric(7).toString(),
          'billing': {'email': _user.user.email},
          'total': discountedpts.toString(),
          'coupon_lines': [''],
          'status': 'completed'
        },
      ),
    );
    if (req.statusCode == 200) {
      _loadinTransactions = false;
      getTransactions();
      _pointsTochange = 0;
      notifyListeners();
      return true;
    } else {
      _loadinTransactions = false;
      notifyListeners();
      return false;
    }
  }
}
