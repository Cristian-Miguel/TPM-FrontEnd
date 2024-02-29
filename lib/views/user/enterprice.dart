import 'package:flutter/material.dart';
import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'package:turismo_flutter/views/user/login.dart';

class Enterprice extends StatefulWidget {
  const Enterprice({super.key});

  @override
  State<Enterprice> createState() => _EnterpriceState();
}

class _EnterpriceState extends State<Enterprice> {
  var isCloseSession = false;

  @override
  Widget build(BuildContext context) {
    return isCloseSession ? const Login() : perfilEmpresaView();
  }

  perfilEmpresaView() {
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
                'Perfil Empresa',
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
