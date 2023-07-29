import 'package:flutter/material.dart';
// import 'package:turismo_flutter/views/OlvidarContrasena.dart';
import 'package:turismo_flutter/views/Perfil.dart';
// import 'package:turismo_flutter/views/SingIn.dart';
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
  var response = 0;
  var isLogged = false;

  getAuthRequest() async {
    var response = await AuthController.postLogin(
        _emailInputTextController.text, _passwordInputTextController.text);
    setState(() {
      response == 201 || response == 200 ? isLogged = true : isLogged = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogged ? const Perfil() : logIn();
  }

  logIn() {
    return SingleChildScrollView(
      child: Form(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 180, 0, 5),
            child: Text(
              'Iniciar sesión',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
              getAuthRequest(),
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return const Size(200, 30);
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
            child: const Text('Iniciar Sesión'),
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
                      indexPage = 3;
                    }),
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return const Size(145, 20);
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
                          : Colors.white;
                    }),
                  ),
                  child: const Text('Olvidaste tu contraseña'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: TextButton(
                  onPressed: () => {
                    setState(() {
                      indexPage = 2;
                    }),
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return const Size(145, 20);
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
                          : Colors.white;
                    }),
                  ),
                  child: const Text('Crear cuenta'),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
