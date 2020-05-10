import 'package:apprewards/src/pages/login_page.dart';
import 'package:apprewards/src/pages/root_page.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    if (userService.user.token == '') {
      return LoginPage();
    } else {
      if (userService.user.token == null) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return RootPage();
      }
    }
  }
}
