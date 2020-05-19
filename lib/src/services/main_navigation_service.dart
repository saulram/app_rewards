import 'package:flutter/material.dart';

class MainNavigationService with ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => _paginaActual;
  PageController _loginController = PageController();

  PageController get controller => _loginController;

  set nuevaPagina(int index) {
    _paginaActual = index;
    this._loginController.animateToPage(_paginaActual,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

  List<double> _factorList = [.08, 0.07, 0.07,0.07,0.07];
  List<bool> _depth = [false, true, true,true,true];

  List get depthenabled => _depth;

  set depthenabled(List newd) {
    _depth = newd;
    notifyListeners();
  }

  set factorListUpdate(List<double> update) {
    _factorList = update;
    notifyListeners();
  }

  List get factorList => _factorList;
}
