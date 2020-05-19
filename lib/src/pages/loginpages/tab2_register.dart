import 'package:animate_do/animate_do.dart';
import 'package:apprewards/src/components/beloni_button.dart';
import 'package:apprewards/src/services/login_navigation_service.dart';
import 'package:apprewards/src/services/user_service.dart';
import 'package:apprewards/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Tab2Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    final navigationService = Provider.of<LoginServiceNavigator>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: whiteBg,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: FormBuilder(
              key: navigationService.registerForm,
              autovalidate: false,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * .9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: FadeInDown(
                        duration: Duration(milliseconds: 900),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * .4,
                              height: MediaQuery.of(context).size.height * .15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/logobelo.png',
                                    ),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            userService.errorLogin == true
                                ? Container(
                                    child: Text(
                                      userService.message,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    padding: EdgeInsets.all(10),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: FadeInRight(
                        duration: Duration(milliseconds: 700),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 5),
                              child: Neumorphic(
                                padding: EdgeInsets.all(5),
                                boxShape: NeumorphicBoxShape.stadium(),
                                style: NeumorphicStyle(
                                  lightSource: LightSource(-1, -1),
                                  shadowLightColor: Color(0xff989898),
                                  depth: -3,
                                  intensity: 1,
                                  surfaceIntensity: 1,
                                  oppositeShadowLightSource: false,
                                  color: whiteBg,
                                ),
                                child: FormBuilderTextField(
                                  attribute: "email",
                                  decoration: InputDecoration(
                                      labelText: "Usuario,correo electrónico",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: InputBorder.none,
                                      alignLabelWithHint: true,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      labelStyle: GoogleFonts.poppins(
                                          color: Colors.grey)),
                                  textInputAction: TextInputAction.done,
                                  validators: [
                                    FormBuilderValidators.email(
                                        errorText: 'Introduce un email valido'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 5),
                              child: Neumorphic(
                                padding: EdgeInsets.all(5),
                                boxShape: NeumorphicBoxShape.stadium(),
                                style: NeumorphicStyle(
                                  lightSource: LightSource(-1, -1),
                                  shadowLightColor: Color(0xff989898),
                                  depth: -3,
                                  intensity: 1,
                                  surfaceIntensity: 1,
                                  oppositeShadowLightSource: false,
                                  color: whiteBg,
                                ),
                                child: FormBuilderTextField(
                                  attribute: "nombre",
                                  decoration: InputDecoration(
                                      labelText: "Nombre",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: InputBorder.none,
                                      alignLabelWithHint: true,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      labelStyle: GoogleFonts.poppins(
                                          color: Colors.grey)),
                                  textInputAction: TextInputAction.done,
                                  validators: [],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 5),
                              child: Neumorphic(
                                padding: EdgeInsets.all(5),
                                boxShape: NeumorphicBoxShape.stadium(),
                                style: NeumorphicStyle(
                                  lightSource: LightSource(-1, -1),
                                  shadowLightColor: Color(0xff989898),
                                  depth: -3,
                                  intensity: 1,
                                  surfaceIntensity: 1,
                                  oppositeShadowLightSource: false,
                                  color: whiteBg,
                                ),
                                child: FormBuilderTextField(
                                  attribute: "surname",
                                  decoration: InputDecoration(
                                      labelText: "Apellidos",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: InputBorder.none,
                                      alignLabelWithHint: true,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      labelStyle: GoogleFonts.poppins(
                                          color: Colors.grey)),
                                  textInputAction: TextInputAction.done,
                                  validators: [

                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 5),
                              child: Neumorphic(
                                padding: EdgeInsets.all(5),
                                boxShape: NeumorphicBoxShape.stadium(),
                                style: NeumorphicStyle(
                                  lightSource: LightSource(-1, -1),
                                  shadowLightColor: Color(0xff989898),
                                  depth: -3,
                                  intensity: 1,
                                  surfaceIntensity: 1,
                                  oppositeShadowLightSource: false,
                                  color: whiteBg,
                                ),
                                child: FormBuilderTextField(
                                  attribute: "password",
                                  obscureText: navigationService.showPassword,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          navigationService.showpassword =
                                              !navigationService.showPassword;
                                        },
                                        child: navigationService.showPassword ==
                                                true
                                            ? Icon(
                                                FontAwesomeIcons.eye,
                                                color: Colors.grey[300],
                                              )
                                            : Icon(
                                                FontAwesomeIcons.eyeSlash,
                                                color: Colors.grey[300],
                                              )),
                                    labelText: "Contraseña",
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    labelStyle: GoogleFonts.poppins(
                                      textStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  validators: [
                                    FormBuilderValidators.minLength(5,
                                        errorText: 'Minimo 5 caracteres.'),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: BeloniButton(
                                width: MediaQuery.of(context).size.width * .6,
                                height:
                                    MediaQuery.of(context).size.height * .06,
                                radius:
                                    MediaQuery.of(context).size.height * .03,
                                child: MaterialButton(
                                  disabledElevation: 0,
                                  onPressed: () async {
                                    if (navigationService
                                        .registerForm.currentState
                                        .saveAndValidate()) {
                                      userService.userEmail = navigationService
                                          .registerForm
                                          .currentState
                                          .value['email'];
                                      userService.userPassword =
                                          navigationService.registerForm
                                              .currentState.value['password'];
                                      userService.name = navigationService
                                          .registerForm
                                          .currentState
                                          .value['nombre'];

                                      userService.surname = navigationService
                                          .registerForm
                                          .currentState
                                          .value['surname'];
                                      await userService.userNewAccount();
                                    }
                                  },
                                  shape: StadiumBorder(),
                                  splashColor: Colors.transparent,
                                  colorBrightness: Brightness.light,
                                  hoverColor: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      userService.isloading == true
                                          ? Center(
                                              child: CircularProgressIndicator(
                                              backgroundColor: whiteBg,
                                              strokeWidth: 1,
                                            ))
                                          : Text(
                                              'Registrar',
                                              style: GoogleFonts.poppins(
                                                  color: whiteBg),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 900),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '¿Ya tienes una cuenta?',
                              style: GoogleFonts.poppins(),
                            ),
                            MaterialButton(
                              child: Center(
                                child: Text(
                                  "Inicia sesión",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              onPressed: () async {
                                navigationService.nuevaPagina = 0;
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
