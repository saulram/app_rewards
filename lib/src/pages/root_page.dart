import 'package:apprewards/src/components/bottom_bar.dart';
import 'package:apprewards/src/pages/views/profile_page.dart';
import 'package:apprewards/src/pages/views/settings_page.dart';
import 'package:apprewards/src/pages/transactions/transaction_page.dart';
import 'package:apprewards/src/services/main_navigation_service.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainNavigationService = Provider.of<MainNavigationService>(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: mainNavigationService.controller,
            children: <Widget>[TransactionPage(), ProfileTab(), SettingsTab(),Container(),Container()],
          ),
          NavBarBottom(
            items: [
              NavItem(
                icono: Icon(FontAwesomeIcons.user),
                position: 0,
              ),
              NavItem(icono: Icon(FontAwesomeIcons.handshake), position: 1),
              NavItem(
                position: 2,
                icono: Icon(FontAwesomeIcons.percentage),
              ),
              NavItem(
                position: 3,
                icono: Icon(FontAwesomeIcons.phoneAlt),
              ),
              NavItem(
                position: 4,
                icono: Icon(FontAwesomeIcons.search),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
