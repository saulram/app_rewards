import 'package:apprewards/src/pages/main_page.dart';
import 'package:apprewards/src/services/coupons_service.dart';
import 'package:apprewards/src/services/login_navigation_service.dart';
import 'package:apprewards/src/services/main_navigation_service.dart';

import 'package:apprewards/src/services/transaction_service.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserService(),
          ),
          ChangeNotifierProxyProvider<UserService, TransactionService>(
            create: (_) => TransactionService(),
            update: (_, userService, transactionService) =>
                transactionService..updateUser(userService.user),
          ),
          ChangeNotifierProvider(
            create: (_) => LoginServiceNavigator(),
          ),
          ChangeNotifierProvider(
            create: (_) => MainNavigationService(),
          ),
          ChangeNotifierProxyProvider<UserService, CouponService>(
            create: (_) => CouponService(),
            update: (_, userService, couponsService) =>
                couponsService..update(userService.user),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: MaterialApp(
        title: 'App de Puntos de Recompensas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColorDark: Colors.red,
            brightness: Brightness.light),
        darkTheme: ThemeData(
            primaryColorDark: Colors.red, primaryColor: Colors.redAccent),
        home: MainPage(),
      ),
    );
  }
}
