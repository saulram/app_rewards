import 'dart:convert';
import 'package:apprewards/src/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/globals.dart';
import 'package:http/http.dart' as http;

class UserService with ChangeNotifier {
  final api = url_api;

  bool _errorLogin = false;
  bool get errorLogin => _errorLogin;
  UserService() {
    /// Al iniciar la app leera las preferencias de usuario en busca de email y password,
    /// si encuentra un email y un password, intentara hacer login automaticamente.
    /// en caso de que no haya email  && password se seteara user.token= ''
    /// si el login es exitoso, se guarda el usuario.
    /// Si el login falla se seteara user.token = ''
    _readUserDataSecure();
  }

  //paramatros para iniciar sesion
  String _email = '';

  //metodo get email
  String get userEmail => _email;

  //metodo set email para modificar la variable privada.
  set userEmail(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';

  //metodo set password
  set userPassword(String passwd) {
    _password = passwd;
    notifyListeners();
  }

  //para manejar la carga de las peticiones de login
  bool _isLoadingSignIn = false;

  bool get isloading => _isLoadingSignIn;

  //Inicializamos el usuario
  User _user = User();

  //Getter para obtener usuario
  User get user => _user;

  //metodo para actualizar el usuario
  set user(User newUser) {
    _user = newUser;
    notifyListeners();
  }
  //nombre usuario registro
  String _name = '';
  set name ( String name){
    _name = name;
    notifyListeners();
  }
  String _surname = '';
  set surname (String surname){
    _surname = surname;
    notifyListeners();
  }


  //para manejar el mensaje si hay error
  String _message = '';
  String get  message => _message;

  //Inicializar el almacenamiento seguro
  final _storage = FlutterSecureStorage();

  /// Servicio para iniciar sesión en el API rest
  userLogin() async {
    this._message = '';
    this._errorLogin = false;
    this._isLoadingSignIn = true;
    final req = await http.post('$api/login/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'email': _email, 'password': _password}));

    if (req.statusCode == 200) {
      _user = userFromJson(req.body);
      _saveUserData();

      _isLoadingSignIn = false;
    } else if (req.statusCode == 404) {
      _user.token = '';
      _message = jsonDecode(req.body)["message"];
      _errorLogin =true;
      _isLoadingSignIn = false;
      print(_message);
    } else {
      _user.token = '';
      _message = jsonDecode(req.body)["message"];
      _isLoadingSignIn = false;
      _errorLogin= true;
      print(_message);
    }
    notifyListeners();
  }


  /// Servicio para Registrarse en el API rest
  userNewAccount() async {
    this._isLoadingSignIn = true;
    final req = await http.post('$api/register/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'email': _email, 'password': _password,'name':_name,'surname':_surname}));

    if (req.statusCode == 200) {

      _isLoadingSignIn = false;
      userLogin();
    } else if (req.statusCode == 404) {
      _user.token = '';
      _message = jsonDecode(req.body)["message"];
      _isLoadingSignIn = false;
    } else {
      _user.token = '';
      _message = jsonDecode(req.body)["message"];
      _isLoadingSignIn = false;
    }
    notifyListeners();
  }

  /// Helper para guardar el login del usuario
  void _saveUserData() async {
    await _storage.write(key: 'email', value: _email);
    await _storage.write(key: 'password', value: _password);
  }

  //helper para ver si ya habia iniciado sesion;
  void _readUserDataSecure() async {
    final all = await _storage.readAll();
    all.forEach((key, value) {
      if (key == 'email') {
        _email = value;
      }
      if (key == 'password') {
        _password = value;
      }
    });
    //si habian registros guardados, intentamos hacer login
    if (_email != '' && _password != '') {
      userLogin();
    } else {
      //si no hay registro, seteamos el token en ''
      _user.token = '';
      notifyListeners();
    }
  }

  //helper para borrar todos los datos del almacen seguro
  void deleteAllUserData() async {
    //se borra completamente el almacen seguro
    await _storage.deleteAll();
  }
}
