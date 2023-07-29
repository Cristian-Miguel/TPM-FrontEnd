import 'package:flutter/material.dart';
import 'package:turismo_flutter/views/Login.dart';
import 'package:turismo_flutter/views/Perfil.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});
  @override
  State<SingIn> createState() => SingInState();
}

class SingInState extends State<SingIn> {
  final _emailInputTextController = TextEditingController();
  final _passwordInputTextController = TextEditingController();
  final _usuarioInputTextController = TextEditingController();
  final _nombreInputTextController = TextEditingController();
  final _apellidoPaternoInputTextController = TextEditingController();
  final _apellidoMaternoInputTextController = TextEditingController();
  final _fechaNacInputTextController = TextEditingController();
  final _rfcInputTextController = TextEditingController();
  var _imagen = "a";
  int indexPage = 0;
  bool isSingIn = true;
  final List<Widget> widgetsChildren = [
    const Perfil(),
    const Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return isSingIn ? SingInView() : widgetsChildren[indexPage];
  }

  SingInView() {
    return SingleChildScrollView(
      child: Form(
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 5),
              child: Text(
                'Crear cuenta',
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
                  "Ingrese la imagen",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: TextFormField(
                controller: _usuarioInputTextController,
                decoration: const InputDecoration(hintText: 'Usuario'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextFormField(
                controller: _emailInputTextController,
                decoration: const InputDecoration(hintText: 'Correo'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                controller: _passwordInputTextController,
                decoration: const InputDecoration(hintText: 'Contraseña'),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                controller: _passwordInputTextController,
                decoration:
                    const InputDecoration(hintText: 'Confirmar contraseña'),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                controller: _nombreInputTextController,
                decoration: const InputDecoration(hintText: 'Nombre'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                controller: _apellidoPaternoInputTextController,
                decoration: const InputDecoration(hintText: 'Apellido Paterno'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                controller: _apellidoMaternoInputTextController,
                decoration: const InputDecoration(hintText: 'Apellido Materno'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                controller: _fechaNacInputTextController,
                decoration: const InputDecoration(hintText: 'Fecha Nacimiento'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextFormField(
                controller: _rfcInputTextController,
                decoration: const InputDecoration(hintText: 'RFC'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 30, 20),
                  child: TextButton(
                    onPressed: () => {
                      _emailInputTextController,
                      _passwordInputTextController,
                      setState(() {
                        isSingIn = false;
                        indexPage = 1;
                      })
                    },
                    child: const Text('Cancelar'),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return Size(100, 20);
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 5, 20),
                  child: TextButton(
                    onPressed: () => {
                      _emailInputTextController,
                      _passwordInputTextController,
                      setState(() {
                        isSingIn = false;
                        indexPage = 0;
                      })
                    },
                    child: const Text('Crear cuenta'),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return Size(180, 20);
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
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
