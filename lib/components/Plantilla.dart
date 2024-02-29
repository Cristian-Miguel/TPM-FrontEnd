import 'package:flutter/material.dart';
import 'package:turismo_flutter/middleware/JWT.dart';
import 'package:turismo_flutter/middleware/VerificarRol.dart';
import 'package:turismo_flutter/views/HomePage.dart';
import 'package:turismo_flutter/views/Descubrir.dart';
import 'package:turismo_flutter/views/Login.dart';
import 'package:turismo_flutter/views/Mensajes.dart';
import 'package:turismo_flutter/views/PerfilAdmin.dart';
import 'package:turismo_flutter/views/PerfilEmpresa.dart';
import 'package:turismo_flutter/views/PerfilUsuario.dart';
import 'package:turismo_flutter/views/Reservas.dart';

class Plantilla extends StatefulWidget {
  const Plantilla({super.key});
  @override
  State<Plantilla> createState() => PlantillaState();
}

class PlantillaState extends State<Plantilla> {
  var indexTap = 0;
  var indexPage = 0;

  final List<Widget> vistas = [
    const HomePage(), //0
    const Descubrir(), //1
    const Reservas(), //2
    const Mensajes(), //3
    const PerfilAdmin(), //4
    const PerfilEmpresa(), //5
    const PerfilUsuario(), //6
    const Login(), //7
  ];

  checkPerfil(int index) async {
    var isValidToken = await JWT.tokenValido();
    int posicion = 7;
    if (isValidToken.toString() == 'true') {
      var rol = await VerificarRol.validarRol();
      switch (rol.toString()) {
        case '1': // * rol Admin
          posicion = 4;
        case '2': // * rol Usuario
          posicion = 6;
        case '3': // * rol Empresa
          posicion = 5;
        default: // * login
          posicion = 7;
      }
    }
    setState(() {
      indexTap = index;
      indexPage = posicion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: vistas[indexPage],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 15,
          backgroundColor: Colors.white,
          onTap: (index) => {
                if (index < 4)
                  {
                    buscar =
                        TextEditingController.fromValue(TextEditingValue.empty),
                    setState(() {
                      indexTap = index;
                      indexPage = index;
                    })
                  }
                else
                  {
                    checkPerfil(index),
                  }
              },
          currentIndex: indexTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pinkAccent,
          iconSize: 30.0,
          selectedFontSize: 14.0,
          unselectedFontSize: 13.0,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Descubrir',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Reservas',
              icon: Icon(Icons.send),
            ),
            BottomNavigationBarItem(
              label: 'Mensajes',
              icon: Icon(Icons.message),
            ),
            BottomNavigationBarItem(
              label: 'Perfil',
              icon: Icon(Icons.account_circle_outlined),
            ),
          ]),
    );
  }
}
//colorChange ? Navigator.of(context).pushNamed(Routes[indexPage]) : Navigator.of(context).pushNamed(Routes[indexTap]),

