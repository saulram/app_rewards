import 'package:apprewards/src/services/login_navigation_service.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class Tab1Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    final navigationService = Provider.of<LoginServiceNavigator>(context);

    final GlobalKey<FormBuilderState> _formLogin = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar'),),
      body: GestureDetector(
        onTap: () {

        },
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formLogin,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  attribute: "email",
                  decoration: InputDecoration(labelText: "email"),
                    textInputAction: TextInputAction.done,
                  validators: [
                    FormBuilderValidators.email(
                        errorText: 'Introduce un email valido'),
                  ],
                ),
                FormBuilderTextField(
                  attribute: "password",
                  obscureText: true,
                  maxLines: 1,
                  decoration: InputDecoration(labelText: "password"),
                  validators: [
                    FormBuilderValidators.minLength(4,
                        errorText:
                            'El password debe ser minimo de 4 caracteres')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      child: Center(
                        child: userService.isloading == true
                            ? CircularProgressIndicator()
                            : Text("Entrar"),
                      ),
                      onPressed: () async {
                        if (_formLogin.currentState.saveAndValidate()) {
                          userService.userEmail =
                              _formLogin.currentState.value['email'];
                          userService.userPassword =
                              _formLogin.currentState.value['password'];
                          await userService.userLogin();
                        }
                      },
                    ),
                    MaterialButton(
                      child: Center(
                        child: userService.isloading == true
                            ? CircularProgressIndicator()
                            : Text("Registrate"),
                      ),
                      onPressed: () async {
                        navigationService.nuevaPagina = 1;
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
