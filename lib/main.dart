import 'package:apprewards/src/pages/main_page.dart';
import 'package:apprewards/src/services/login_navigation_service.dart';
import 'package:apprewards/src/services/main_navigation_service.dart';
import 'package:apprewards/src/services/transaction_service.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:flutter/material.dart';
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
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Puntos de Recompensas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: Colors.red,
      ),
      darkTheme: ThemeData(
          primaryColorDark: Colors.red, primaryColor: Colors.redAccent),
      home: MainPage(),
    );
  }
}
