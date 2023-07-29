import 'package:flutter/material.dart';
import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'package:turismo_flutter/views/Login.dart';

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({super.key});
  @override
  State<PerfilUsuario> createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  var isCloseSession = false;

  @override
  Widget build(BuildContext context) {
    return isCloseSession ? const Login() : perfilUsuarioView();
  }

  perfilUsuarioView() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: TextButton(
                onPressed: () => {},
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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text(
                'Perfil Usuario',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: TextButton(
                onPressed: () async => {
                  await ManageSecureStorage.deleteToken(),
                  setState(() {
                    isCloseSession = true;
                  }),
                },
                child: const Text("cerrar sesion"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
