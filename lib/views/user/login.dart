import 'dart:async';
import 'package:flutter/material.dart';
import 'package:turismo_flutter/config/encryptor.dart';
import 'package:turismo_flutter/config/google_auth.dart';
import 'package:turismo_flutter/config/constants/index.dart';
import 'package:turismo_flutter/config/constants/error_message.dart';
import 'package:turismo_flutter/config/constants/validate_field.dart';
import 'package:turismo_flutter/controllers/auth/login_controller.dart';
import 'package:turismo_flutter/controllers/auth/google_auth_controller.dart';
import 'package:turismo_flutter/components/alerts/index.dart';
import 'package:turismo_flutter/components/others/load_screen.dart';
import 'package:turismo_flutter/views/user/forget_password.dart';
import 'package:turismo_flutter/views/user/profile.dart';
import 'package:turismo_flutter/views/user/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final _emailInputTextController = TextEditingController();
  final _passwordInputTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var indexPage = 0;
  var response = 0;
  var errorMenssage = '';
  var isView = false;
  var isCharging = false;
  var isError = false;
  var hiddenPassword = true;
  var iconEye = const Icon(Icons.visibility);

  final List<Widget> _listaViews = [
    const Profile(),
    const SignUp(),
    const ForgetPassword(),
  ];

  _checkResponse(response) async {
    if (response == 201 || response == 200) {
      Timer(const Duration(milliseconds: 1500), () {
        setState(() {
          isCharging = false;
          indexPage = 0;
          isView = true;
        });
      });
    } else if (response >= 500 && response <= 511) {
      setState(() {
        isView = false;
        Alerts(
          ErrorMessage.genericError_500,
          MainConstant.errorAlert,
        ).generateAlerts(context);
      });
    } else {
      Timer(const Duration(milliseconds: 1500), () {
        setState(() {
          isView = false;
          Alerts(
            ErrorMessage.failPassword,
            MainConstant.errorAlert,
          ).generateAlerts(context);
        });
      });
    }
  }

  _getAuthRequestLogin() async {
    setState(() {
      isCharging = true;
    });
    if (_formKey.currentState!.validate()) {
      var password = Encryptor.encriptarPassword(
          _emailInputTextController.text.toLowerCase(),
          _passwordInputTextController.text);
      var response = await LoginController.postLogin(
          _emailInputTextController.text.toLowerCase(), password);
      _checkResponse(response);
      isCharging = false;
    } else {
      setState(() {
        isCharging = false;
      });
    }
  }

  Future _singUpGoogle() async {
    final idToken = await GoogleAuthAPI.login();
    setState(() {
      isCharging = true;
    });
    var response = await GoogleAuthController.postGoogleAuthSignUp(idToken);
    _checkResponse(response);
    setState(() {
      isCharging = false;
    });
  }

  Future _signInGoogle() async {
    final idToken = await GoogleAuthAPI.login();
    setState(() {
      isCharging = true;
    });
    var response = await GoogleAuthController.postGoogleAuthSignIn(idToken);
    _checkResponse(response);
    setState(() {
      isCharging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isView ? _listaViews[indexPage] : authPage();
  }

  authPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign in",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.black), // Change color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100, bottom: 5),
                    child: Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 50, bottom: 0, left: 20, right: 20),
                    child: TextFormField(
                      controller: _emailInputTextController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: (value) {
                        var validation = [
                          [
                            (value == null || value.isEmpty),
                            ErrorMessage.emptyField
                          ],
                          [
                            ValidateField.validateRegex(
                                value, RegexField.email),
                            ErrorMessage.notValidEmail
                          ]
                        ];

                        return ValidateField.printError(validation);
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 0, right: 20, left: 20),
                        child: TextFormField(
                          controller: _passwordInputTextController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hiddenPassword = (!hiddenPassword);
                                  hiddenPassword
                                      ? iconEye = const Icon(Icons.visibility)
                                      : iconEye =
                                          const Icon(Icons.visibility_off);
                                });
                              },
                              alignment: Alignment.bottomCenter,
                              padding: const EdgeInsets.all(0),
                              icon: iconEye,
                            ),
                          ),
                          obscureText: hiddenPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ErrorMessage.emptyField;
                            } else if (value.length < 8) {
                              return ErrorMessage.shortPassword;
                            } else if (value.length > 17) {
                              return ErrorMessage.largePassword;
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: 20, top: 6, right: 20),
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () => {
                            setState(() {
                              indexPage = 2;
                              isView = true;
                            }),
                          },
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> states) {
                              return const Size(140, 10);
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> states) {
                              return states.contains(MaterialState.disabled)
                                  ? null
                                  : Colors.blue;
                            }),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> states) {
                              return states.contains(MaterialState.disabled)
                                  ? null
                                  : Colors.transparent;
                            }),
                          ),
                          child: const Text('Forgot your password?'),
                        ),
                      ),
                    ],
                  ),
                  //* Boton de inicio de sesion
                  TextButton(
                    onPressed: _getAuthRequestLogin,
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return const Size(310, 40);
                      }),
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled)
                            ? null
                            : Colors.white;
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled)
                            ? null
                            : const Color.fromRGBO(255, 55, 92, 1.0);
                      }),
                    ),
                    child: const Text('Sign in'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text('- or -'),
                  ),
                  //* login de google
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 2),
                    width: 300,
                    height: 40,
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: _signInGoogle,
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return const Size(300, 40);
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled)
                              ? null
                              : Colors.white;
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled)
                              ? null
                              : Colors.black38;
                        }),
                        alignment: Alignment.center,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.g_mobiledata_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'Sign up to Google',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 20,
                    thickness: 0.8,
                    indent: 10,
                    endIndent: 10,
                  ),
                  //*Registro de correo
                  Container(
                    margin: const EdgeInsets.only(top: 1, bottom: 1),
                    width: 300,
                    height: 40,
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () => {
                        setState(() {
                          indexPage = 1;
                          isView = true;
                        }),
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return const Size(310, 40);
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled)
                              ? null
                              : Colors.white;
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled)
                              ? null
                              : const Color.fromRGBO(255, 55, 92, 1.0);
                        }),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 2),
                            child: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Create account',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //* Registro de google
                  Container(
                    margin: const EdgeInsets.only(top: 1, bottom: 1),
                    width: 300,
                    height: 40,
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: _singUpGoogle,
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return const Size(300, 40);
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled)
                              ? null
                              : Colors.white;
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled)
                              ? null
                              : Colors.black38;
                        }),
                        alignment: Alignment.center,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 2),
                            child: const Icon(
                              Icons.g_mobiledata,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Create new account with google',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: isCharging,
                child: const LoadScreen(loadText: 'logger'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
