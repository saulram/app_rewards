import 'package:flutter/material.dart';

class MainNavigationService with ChangeNotifier {
  int _paginaActual = 0;
  int get paginaActual =>_paginaActual;
  PageController _loginController = PageController();

  PageController get controller => _loginController;

  set nuevaPagina ( int index){
    _paginaActual = index;
    this._loginController.animateToPage(_paginaActual, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

}
