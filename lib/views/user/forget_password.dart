import 'package:flutter/material.dart';
import 'package:turismo_flutter/config/constants/error_message.dart';
import 'package:turismo_flutter/config/constants/validate_field.dart';
import 'package:turismo_flutter/views/user/login.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  @override
  State<ForgetPassword> createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword> {
  final _emailInputTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isExit = false;

  @override
  Widget build(BuildContext context) {
    return isExit ? const Login() : olvidarContrasenaView();
  }

  olvidarContrasenaView() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 220, 0, 20),
                child: Text(
                  'Reset password',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //* Boton omitir
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                    child: TextButton(
                      onPressed: () => {
                        setState(() {
                          isExit = true;
                        })
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
                              : Colors.black;
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled)
                              ? null
                              : Colors.transparent;
                        }),
                      ),
                      child: const Text('Omit'),
                    ),
                  ),
                  //* Boton restablecer
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                    child: TextButton(
                      onPressed: () => {
                        _emailInputTextController,
                        setState(() {
                          isExit = true;
                        })
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          return const Size(200, 40);
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
                      child: const Text('Reset'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
