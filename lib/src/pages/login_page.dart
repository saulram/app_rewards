import 'package:apprewards/src/pages/loginpages/tab1_login.dart';
import 'package:apprewards/src/pages/loginpages/tab2_register.dart';
import 'package:apprewards/src/services/login_navigation_service.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginServiceNavigator>(context);

    return PageView(
      controller: controller.controller,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Login(),
        Tab2Register(),
      ],
    );
  }
}
