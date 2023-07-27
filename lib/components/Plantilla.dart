import 'package:flutter/material.dart';
import 'package:turismo_flutter/views/HomePage.dart';
import 'package:turismo_flutter/views/Descubrir.dart';
import 'package:turismo_flutter/views/Mensajes.dart';
import 'package:turismo_flutter/views/Perfil.dart';
import 'package:turismo_flutter/views/Reservas.dart';

class Plantilla extends StatefulWidget {
  const Plantilla({super.key});
  @override
  State<Plantilla> createState() => PlantillaState();
}

class PlantillaState extends State<Plantilla> {

  var indexTap = 0;
  var indexPage = 0;
  bool colorChange = false;
  var desc = 0;

  final List<Widget> vistas = [
    const HomePage(),
    const Descubrir(),
    const Reservas(),
    const Mensajes(),
    const Perfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: colorChange ? vistas[indexPage] : vistas[indexTap],
        bottomNavigationBar:BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: (index) => {
              if(index == 1) buscar = TextEditingController.fromValue(TextEditingValue.empty),
              desc = 0,
              setState(() {
                indexTap = index;
                colorChange = false;
              })
            },
            currentIndex: indexTap,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: colorChange ? Colors.black54 : Colors.pinkAccent,
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
            ]
        ),
    );
  }
}
//colorChange ? Navigator.of(context).pushNamed(Routes[indexPage]) : Navigator.of(context).pushNamed(Routes[indexTap]),

