import 'package:flutter/material.dart';
import 'package:turismo_flutter/views/OlvidarContrasena.dart';
import 'package:turismo_flutter/views/Perfil.dart';
import 'package:turismo_flutter/views/SingIn.dart';
import 'package:turismo_flutter/Controllers/AuthController.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {

  final _emailInputTextController = TextEditingController();
  final _passwordInputTextController = TextEditingController();
  var indexPage = 0;
  var isLogin = true;

  final List<Widget> widgetsChildren = [
    Perfil(),
    SingIn(),
    OlvidarContrasena(),
  ];

  @override
  Widget build(BuildContext context) {
    return isLogin ? LogIn() : widgetsChildren[indexPage];
  }

  LogIn(){
    return SingleChildScrollView(
      child: Form(
        child:Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 180, 0, 5),
                child: Text('Iniciar sesión', style: Theme.of(context).textTheme.headlineMedium,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: TextField(
                  controller: _emailInputTextController,
                  decoration: const InputDecoration(hintText: 'Correo'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: TextField(
                  controller: _passwordInputTextController,
                  decoration: const InputDecoration(hintText: 'Contraseña'),
                  obscureText: true,
                ),
              ),
              TextButton(
                onPressed: () => {
                  _emailInputTextController.text,
                  _passwordInputTextController.text,
                  setState(() {
                    AuthController.postLogin(
                        _emailInputTextController.text,
                        _passwordInputTextController.text
                    );
                    isLogin = false;
                    indexPage = 0;
                  })
                },
                child: const Text('Iniciar Sesión'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                    return const Size(200, 30);
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                    return states.contains(MaterialState.disabled) ? null : Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                    return states.contains(MaterialState.disabled) ? null : const Color.fromRGBO(255, 55, 92, 1.0);
                  }),
                ),
              ),
              const Divider(
                color: Colors.black,
                height: 25,
                thickness: 0.8,
                indent: 40,
                endIndent: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                    child: TextButton(
                      onPressed: () => {
                        setState(() {
                          isLogin = false;
                          indexPage = 2;
                        })
                      },
                      child: const Text('Olvidaste tu contraseña'),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                          return const Size(145, 20);
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled) ? null : Colors.black54;
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled) ? null : Colors.white;
                        }),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child:TextButton(
                        onPressed: () => {
                          setState(() {
                            isLogin = false;
                            indexPage = 1;
                          })
                        },
                        child: const Text('Crear cuenta'),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                            return Size(145, 20);
                          }),
                          foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                            return states.contains(MaterialState.disabled) ? null : Colors.black54;
                          }),
                          backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                            return states.contains(MaterialState.disabled) ? null : Colors.white;
                          }),
                        ),
                      ),
                  ),
                ],
              ),

            ]
        ),
      ),
    );
  }
}