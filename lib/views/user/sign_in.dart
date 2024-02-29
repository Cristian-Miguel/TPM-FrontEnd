import 'package:flutter/material.dart';
import 'package:turismo_flutter/config/constants/validate_field.dart';
import 'package:turismo_flutter/controllers/AuthController.dart';
import 'package:turismo_flutter/config/Encriptar.dart';
import 'package:turismo_flutter/config/constants/error_message.dart';
import 'package:turismo_flutter/views/user/login.dart';
import 'package:turismo_flutter/views/user/profile.dart';
import 'package:turismo_flutter/components/PantallaCarga.dart';
import 'package:intl/intl.dart';
import 'package:turismo_flutter/components/Alertas.dart';
import 'dart:async';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailInputTextController = TextEditingController();
  final _confirmPasswordInputTextController = TextEditingController();
  final _passwordInputTextController = TextEditingController();
  final _userInputTextController = TextEditingController();
  final _nameInputTextController = TextEditingController();
  final _lastNameInputTextController = TextEditingController();
  final _birthDateInputTextController = TextEditingController();
  final _rfcInputTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _image = "a";
  int indexPage = 0;
  bool isSingIn = true;
  bool isCharging = false;
  var hiddenPassword1 = true;
  var iconEye1 = const Icon(Icons.visibility);
  var hiddenPassword2 = true;
  var iconEye2 = const Icon(Icons.visibility);

  final List<Widget> widgetsChildren = [
    const Profile(),
    const Login(),
  ];

  checkResponse(response) async {
    if (response == 201 || response == 200) {
      Timer(const Duration(milliseconds: 1500), () {
        setState(() {
          isSingIn = true;
          indexPage = 0;
        });
      });
    } else if (response >= 500 && response <= 511) {
      setState(() {
        const Alertas(
          indexAlerta: 0,
          textoAlerta: 'Error en el servidor intentelo mas tarde',
        ).generarAlerta(context);
      });
    } else {
      Timer(const Duration(milliseconds: 1500), () {
        setState(() {
          const Alertas(
            indexAlerta: 0,
            textoAlerta: 'Error en algun campo',
          ).generarAlerta(context);
        });
      });
    }
  }

  postRegistro() async {
    setState(() {
      isCharging = true;
    });
    if (_formKey.currentState!.validate()) {
      var encriptado = Encriptar.encriptarPassword(
          _emailInputTextController.text, _passwordInputTextController.text);
      var registroJson = {
        "Email": _emailInputTextController.text,
        "UserName": _userInputTextController.text,
        "Password": encriptado,
        "Name": _nameInputTextController.text,
        "Last Name": _lastNameInputTextController.text,
        "Birth Date": _birthDateInputTextController.text,
        "RFC": _rfcInputTextController.text,
        "Image": _image
      };
      var response = await AuthController.postSignIn(registroJson);
      checkResponse(response);
    }
    setState(() {
      isCharging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isSingIn ? singInView() : widgetsChildren[indexPage];
  }

  singInView() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Stack(children: [
          Visibility(
            visible: !isCharging,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 5),
                child: Text(
                  'Register account',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: TextButton(
                  onPressed: () =>
                      {_emailInputTextController, _passwordInputTextController},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return const Size(120, 120);
                    }),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : const Color.fromRGBO(211, 211, 211, 1.0);
                    }),
                    shape: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return const CircleBorder(
                          side: BorderSide.none, eccentricity: 0.1);
                    }),
                  ),
                  child: const Text(
                    "Save image",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
              //* Usuario
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: TextFormField(
                  controller: _userInputTextController,
                  decoration: const InputDecoration(
                    labelText: 'User',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? ErrorMessage.emptyField
                        : null;
                  },
                ),
              ),
              //* Email
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
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
                        ValidateField.validateRegex(value, RegexField.email),
                        ErrorMessage.notValidEmail
                      ]
                    ];

                    return ValidateField.printError(validation);
                  },
                ),
              ),
              //* Password
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
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
                          hiddenPassword1 = (!hiddenPassword1);
                          hiddenPassword1
                              ? iconEye1 = const Icon(Icons.visibility)
                              : iconEye1 = const Icon(Icons.visibility_off);
                        });
                      },
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(0),
                      icon: iconEye1,
                    ),
                  ),
                  obscureText: hiddenPassword1,
                  validator: (value) {
                    var validation = [
                      [
                        (value == null || value.isEmpty),
                        ErrorMessage.emptyField
                      ],
                      [
                        ValidateField.validateRegex(value, RegexField.password),
                        ErrorMessage.notValidateCharacters
                      ],
                      [
                        value.toString() !=
                            _passwordInputTextController.text.toString(),
                        ErrorMessage.notMatchPassword
                      ]
                    ];

                    return ValidateField.printError(validation);
                  },
                ),
              ),
              //* Confirm password
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: TextFormField(
                  controller: _confirmPasswordInputTextController,
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hiddenPassword2 = (!hiddenPassword2);
                          hiddenPassword2
                              ? iconEye2 = const Icon(Icons.visibility)
                              : iconEye2 = const Icon(Icons.visibility_off);
                        });
                      },
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(0),
                      icon: iconEye2,
                    ),
                  ),
                  obscureText: hiddenPassword2,
                  validator: (value) {
                    var validation = [
                      [
                        (value == null || value.isEmpty),
                        ErrorMessage.emptyField
                      ],
                      [
                        ValidateField.validateRegex(value, RegexField.password),
                        ErrorMessage.notValidateCharacters
                      ],
                      [
                        value.toString() !=
                            _passwordInputTextController.text.toString(),
                        ErrorMessage.notMatchPassword
                      ]
                    ];

                    return ValidateField.printError(validation);
                  },
                ),
              ),
              //* Nombre
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: TextFormField(
                  controller: _nameInputTextController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
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
                        ValidateField.validateRegex(value, RegexField.letters),
                        ErrorMessage.notValidateCharacters
                      ]
                    ];

                    return ValidateField.printError(validation);
                  },
                ),
              ),
              //* Apellido Paterno
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: TextFormField(
                  controller: _lastNameInputTextController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
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
                        ValidateField.validateRegex(value, RegexField.letters),
                        ErrorMessage.notValidateCharacters
                      ]
                    ];

                    return ValidateField.printError(validation);
                  },
                ),
              ),
              //* Fecha de nacimiento
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: TextFormField(
                  controller: _birthDateInputTextController,
                  decoration: InputDecoration(
                    labelText: 'Birth Date',
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context, //context of current state
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            _birthDateInputTextController.text = formattedDate;
                          });
                        }
                      },
                      icon: const Icon(Icons.date_range),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  validator: (value) {
                    var validation = [
                      [
                        (value == null || value.isEmpty),
                        ErrorMessage.emptyField
                      ],
                      [
                        ValidateField.validateRegex(value, RegexField.date),
                        ErrorMessage.notValidateCharacters
                      ]
                    ];

                    return ValidateField.printError(validation);
                  },
                ),
              ),
              //* RFC
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: TextFormField(
                  controller: _rfcInputTextController,
                  decoration: const InputDecoration(
                    labelText: 'RFC',
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
                        ValidateField.validateRegex(value, RegexField.rfc),
                        ErrorMessage.notValidateCharacters
                      ]
                    ];

                    return ValidateField.printError(validation);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 20, 30, 20),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isSingIn = true;
                          indexPage = 1;
                        });
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return const Size(100, 40);
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled)
                              ? null
                              : Colors.black54;
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled)
                              ? null
                              : Colors.transparent;
                        }),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 5, 20),
                    child: TextButton(
                      onPressed: postRegistro,
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return const Size(180, 40);
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
                      child: const Text('SignIn'),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Visibility(
            visible: isCharging,
            child: const PantallaCarga(
                textoCarga: 'Wait a minute, we charge the data'),
          ),
        ]),
      ),
    );
  }
}
