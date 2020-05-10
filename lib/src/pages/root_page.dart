import 'package:apprewards/src/pages/views/profile_page.dart';
import 'package:apprewards/src/pages/views/settings_page.dart';
import 'package:apprewards/src/pages/views/transaction_page.dart';
import 'package:apprewards/src/services/main_navigation_service.dart';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainNavigationService = Provider.of<MainNavigationService>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: mainNavigationService.paginaActual,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) {
          mainNavigationService.nuevaPagina = index;
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Inicio'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people_outline),
            title: Text('Profile'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Home'),
            activeColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: mainNavigationService.controller,
        children: <Widget>[
          TransactionPage(),
          ProfileTab(),
          SettingsTab()
        ],
      ),
    );
  }
}
