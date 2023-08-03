import 'package:flutter/material.dart';
import 'package:turismo_flutter/config/ValidarCampos.dart';
import 'package:turismo_flutter/views/OlvidarContrasena.dart';
import 'package:turismo_flutter/views/Perfil.dart';
import 'package:turismo_flutter/Controllers/AuthController.dart';
import 'package:turismo_flutter/config/Encriptar.dart';
import 'package:turismo_flutter/views/SingIn.dart';

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
  var isView = false;

  final List<Widget> listaViews = [
    const Perfil(),
    const SingIn(),
    const OlvidarContrasena(),
  ];

  getAuthRequest() async {
    if (_formKey.currentState!.validate()) {
      var password = Encriptar.encriptarPassword(
          _emailInputTextController.text, _passwordInputTextController.text);
      var response = await AuthController.postLogin(
          _emailInputTextController.text, password);
      setState(() {
        response == 201 || response == 200 ? isView = true : isView = false;
      });
    }
  }

  @override
  void dispose() {
    _emailInputTextController.dispose();
    _passwordInputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isView ? listaViews[indexPage] : logIn();
  }

  logIn() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 5),
              child: Text(
                'Iniciar sesión',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 50, bottom: 0, left: 20, right: 20),
              child: TextFormField(
                controller: _emailInputTextController,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo vacio';
                  if (ValidarCampos.validarCorreo(value))
                    return 'Ingrese un correo';
                  return null;
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
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Campo vacio';
                      if (value.length < 8) return 'Demasiado corto';
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 6, right: 20),
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
                    child: const Text('¿Olvidaste tu contraseña?'),
                  ),
                ),
              ],
            ),
            //* Boton de inici de sesion
            TextButton(
              onPressed: () => {
                getAuthRequest(),
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
              child: const Text('Iniciar sesión'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text('- o -'),
            ),
            //* login de google
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 2),
              width: 300,
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => {},
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
                      'Continuar con google',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //* login de facebook
            Container(
              margin: const EdgeInsets.only(top: 2, bottom: 1),
              width: 300,
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => {},
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
                        : Colors.blue;
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
                        Icons.facebook,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Continuar con facebook',
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
                      'Registrar con Correo',
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
                onPressed: () => {},
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
                        Icons.g_mobiledata_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Registrar con google',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //* Registro de facebook
            Container(
              margin: const EdgeInsets.only(top: 0, bottom: 10),
              width: 300,
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => {},
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
                        : Colors.blue;
                  }),
                  alignment: Alignment.center,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 2),
                      child: const Icon(
                        Icons.facebook_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Registrar con facebook',
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
      ),
    );
  }
}
