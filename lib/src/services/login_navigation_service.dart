import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginServiceNavigator with ChangeNotifier {
  int _paginaActual = 0;
  PageController _loginController = PageController();

  PageController get controller => _loginController;

  set nuevaPagina ( int index){
    _paginaActual = index;
    this._loginController.animateToPage(_paginaActual, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }
  final GlobalKey<FormBuilderState> _formLogin = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get loginform => _formLogin;
  bool _showPassword = true;
  bool get showPassword => _showPassword;
  set showpassword ( bool updatedstatus){
    _showPassword = updatedstatus;
    notifyListeners();
  }
}
