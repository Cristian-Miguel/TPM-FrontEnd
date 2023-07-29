import 'package:flutter/material.dart';
import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'package:turismo_flutter/views/Login.dart';

class PerfilAdmin extends StatefulWidget {
  const PerfilAdmin({super.key});

  @override
  State<PerfilAdmin> createState() => _PerfilAdminState();
}

class _PerfilAdminState extends State<PerfilAdmin> {
  var isCloseSession = false;

  @override
  Widget build(BuildContext context) {
    return isCloseSession ? const Login() : perfilAdminView();
  }

  perfilAdminView() {
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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text(
                'Perfil Administrador',
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
