import 'package:apprewards/src/services/login_navigation_service.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class Tab2Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    final navigationService = Provider.of<LoginServiceNavigator>(context);

    final GlobalKey<FormBuilderState> _form = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _form,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  attribute: "email",
                textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: "email"),
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
                FormBuilderTextField(
                  attribute: "name",
                  maxLines: 1,
                  decoration: InputDecoration(labelText: "name"),
                  validators: [
                    FormBuilderValidators.minLength(4,
                        errorText:
                        'El password debe ser minimo de 4 caracteres')
                  ],
                ),
                FormBuilderTextField(
                  attribute: "surname",
                  maxLines: 1,
                  decoration: InputDecoration(labelText: "surname"),
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
                        if (_form.currentState.saveAndValidate()) {
                          userService.userEmail =
                          _form.currentState.value['email'];
                          userService.userPassword =
                          _form.currentState.value['password'];
                          userService.name=_form.currentState.value['name'];

                          userService.surname=_form.currentState.value['surname'];
                          await userService.userNewAccount();
                        }
                      },
                    ),
                    MaterialButton(
                      child: Center(
                        child: userService.isloading == true
                            ? CircularProgressIndicator()
                            : Text("Ya tengo Cuenta"),
                      ),
                      onPressed: () async {
                        navigationService.nuevaPagina = 0;
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
