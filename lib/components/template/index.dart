import 'package:flutter/material.dart';
import 'package:turismo_flutter/middleware/jwt_manage.dart';
import 'package:turismo_flutter/middleware/check_rol.dart';
import 'package:turismo_flutter/config/constants/index.dart';
import 'package:turismo_flutter/components/template/screens.dart';

class Template extends StatefulWidget {
  const Template({super.key});
  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  var indexTap = 0;
  var indexPage = 0;
  var search;

  final List<Widget> views = Screens().getMainViews();

  _checkPerfil(int index) async {
    var isValidToken = await JwtManage.validToken();
    int viewRol = 5;
    if (isValidToken.toString() == 'true') {
      // int rol = await VerificarRol.validarRol();
      viewRol = 4;
      // switch (rol) {
      //   case MainConstant.administrator:
      //     viewRol = 4;
      //   case MainConstant.user:
      //     viewRol = 6;
      //   case MainConstant.enterprice:
      //     viewRol = 5;
      //   default: // * Login view
      //     viewRol = 5;
      // }
    }
    setState(() {
      indexTap = index;
      indexPage = viewRol;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: views[indexPage],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 15,
          backgroundColor: Colors.white,
          onTap: (index) => {
                if (index < 4)
                  {
                    search =
                        TextEditingController.fromValue(TextEditingValue.empty),
                    setState(() {
                      indexTap = index;
                      indexPage = index;
                    })
                  }
                else
                  {
                    _checkPerfil(index),
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
              label: 'Search',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Reservation',
              icon: Icon(Icons.send),
            ),
            BottomNavigationBarItem(
              label: 'Message',
              icon: Icon(Icons.message),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.account_circle_outlined),
            ),
          ]),
    );
  }
}
//colorChange ? Navigator.of(context).pushNamed(Routes[indexPage]) : Navigator.of(context).pushNamed(Routes[indexTap]),

