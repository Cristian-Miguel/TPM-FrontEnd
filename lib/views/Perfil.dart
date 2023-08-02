import 'package:flutter/material.dart';
import 'package:turismo_flutter/views/Login.dart';
import 'package:turismo_flutter/middleware/JWT.dart';
import 'package:turismo_flutter/middleware/VerificarRol.dart';
import 'package:turismo_flutter/views/PerfilAdmin.dart';
import 'package:turismo_flutter/views/PerfilEmpresa.dart';
import 'package:turismo_flutter/views/PerfilUsuario.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});
  @override
  State<Perfil> createState() => PerfilState();
}

class PerfilState extends State<Perfil> {
  var isCloseSession = false;
  int posicion = 3;

  getValidaciones() async {
    var isValidToken = await JWT.tokenValido();
    int posicion = 3;
    if (isValidToken.toString() == 'true') {
      var rol = await VerificarRol.validarRol();
      switch (rol.toString()) {
        case '1':
          posicion = 0;
        case '2':
          posicion = 1;
        case '3':
          posicion = 2;
        default:
          posicion = 3;
      }
    }
    setState(() {
      this.posicion = posicion;
    });
  }

  @override
  void initState() {
    super.initState();
    getValidaciones();
  }

  final List<Widget> vistas = [
    const PerfilAdmin(),
    const PerfilUsuario(),
    const PerfilEmpresa(),
    const Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: posicion,
      children: vistas,
    );
  }
}
