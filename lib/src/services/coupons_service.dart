import 'dart:convert';

import 'package:apprewards/src/models/coupon_model.dart';
import 'package:apprewards/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';
import '../utils/globals.dart';

class CouponService with ChangeNotifier {
  User _user = User();
  List<Coupon> _cuponList = [];
  bool _cuponCreated;

  bool get cuponCreated => _cuponCreated;

  List<Coupon> get cuponlist => _cuponList;
  bool _loadingCoupons = false;

  bool get loadingCp => _loadingCoupons;
  String _stablishment = '';

  String get stablishment => _stablishment;

  set stablishment(String stab) {
    _stablishment = stab;
    notifyListeners();
  }

  void update(User user) {
    _user = user;

    getUserCoupons();
    notifyListeners();
  }

  void getUserCoupons() async {
    _loadingCoupons = true;
    notifyListeners();
    _cuponList = [];
    var req = await http.post('$url_api/get-user-coupons',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': _user.token
        },
        body: jsonEncode(<String, String>{'email': _user.user.email}));
    var body = jsonDecode(req.body);

    if (req.statusCode == 200) {
      for (int i = 0; i < body.length; i++) {
        Coupon coupon1 = couponFromJson(jsonEncode(body[i]));

        _cuponList.add(coupon1);
      }
      _loadingCoupons = false;

      notifyListeners();
    } else {
      print(jsonDecode(req.body));
      _loadingCoupons = false;
      notifyListeners();
    }
  }

  Future<bool> createCupon(int monto) async {
    int mountInMxn = monto ~/ 100000;

    String cpName = randomString(7, from: 55, to: 80);
    _loadingCoupons = true;

    final req = await http.post(
      '$url_api/create-coupon',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': _user.token,
      },
      body: jsonEncode(
        <String, String>{
          'url': _stablishment,
          'type': 'fixed_cart',
          'name': cpName,
          'email': _user.user.email,
          'amount': '$mountInMxn'
        },
      ),
    );

    if (req.statusCode == 200) {
      getUserCoupons();
      notifyListeners();
      return true;

    } else {
      notifyListeners();
      return false;
    }
  }
}
