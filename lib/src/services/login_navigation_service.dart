import 'package:flutter/material.dart';

class LoginServiceNavigator with ChangeNotifier {
  int _paginaActual = 0;
  PageController _loginController = PageController();

  PageController get controller => _loginController;

  set nuevaPagina ( int index){
    _paginaActual = index;
    this._loginController.animateToPage(_paginaActual, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

}
