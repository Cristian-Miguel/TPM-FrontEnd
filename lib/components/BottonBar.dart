import 'package:flutter/material.dart';
import 'package:turismo_flutter/config/Routes.dart';

class BottonBar extends StatefulWidget {
  const BottonBar({super.key});
  @override
  State<BottonBar> createState() => BottonBarState();
}

class BottonBarState extends State<BottonBar> {

  int indexTap = 0;
  // // var indexPage = 0;
  // bool colorChange = false;
  // var desc = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> Routes = [
      RouteManager.Homepage_Route,
      RouteManager.Descubrir_Route,
      RouteManager.Reservas_General_Route,
      RouteManager.Mensajes_Route,
      RouteManager.Login_Route
    ];
    bool colorChange = false;
    return NavigationBar(
      selectedIndex: indexTap,
      destinations: const[
          NavigationDestination(icon: Icon(Icons.home), label: 'Inicio',),
          NavigationDestination(icon: Icon(Icons.search), label: 'Descubrir'),
          NavigationDestination(icon: Icon(Icons.send), label: 'Reservas'),
          NavigationDestination(icon: Icon(Icons.message), label: 'Mensajes'),
          NavigationDestination(icon: Icon(Icons.account_circle_outlined), label: 'Perfil')
      ],
      backgroundColor: Colors.white,
      shadowColor: Colors.pinkAccent,
      onDestinationSelected: (int value) {
        setState(() {
          indexTap = value;
          Navigator.of(context).pushNamed(Routes[indexTap]);
        });
      },
    );
  }
}

// Scaffold(
// backgroundColor: Colors.white,
// body: colorChange ? widgetsChildren[indexPage] : widgetsChildren[indexTap],
// bottomNavigationBar:
// ),
// BottomNavigationBar(
//       backgroundColor: Colors.white,
//       onTap: (index) => {
//         // if(index == 1) buscar = TextEditingController.fromValue(TextEditingValue.empty),
//         // desc = 0,
//         // setState(() {
//           Navigator.of(context).pushNamed(Routes[index]),
//           colorChange = false,
//         // })
//       },
//       currentIndex: indexTap,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: colorChange ? Colors.black54 : Colors.pinkAccent,
//       iconSize: 30.0,
//       selectedFontSize: 14.0,
//       unselectedFontSize: 13.0,
//       items: const [
//         BottomNavigationBarItem(
//           label: 'Home',
//           icon: Icon(Icons.home),
//         ),
//         BottomNavigationBarItem(
//           label: 'Descubrir',
//           icon: Icon(Icons.search),
//         ),
//         BottomNavigationBarItem(
//           label: 'Reservas',
//           icon: Icon(Icons.send),
//         ),
//         BottomNavigationBarItem(
//           label: 'Mensajes',
//           icon: Icon(Icons.message),
//         ),
//         BottomNavigationBarItem(
//           label: 'Perfil',
//           icon: Icon(Icons.account_circle_outlined),
//         ),
//       ]