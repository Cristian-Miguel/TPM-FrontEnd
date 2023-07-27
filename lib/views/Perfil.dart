import 'package:flutter/material.dart';
import 'package:turismo_flutter/views/Login.dart';
import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'package:turismo_flutter/middleware/JWT.dart';
import 'package:turismo_flutter/middleware/VerificarRol.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});
  @override
  State<Perfil> createState() => PerfilState();
}

class PerfilState extends State<Perfil> {

  var isCloseSession = false;
  var isValidToken;
  var Rol;

  GetValidaciones() async {
      var isValidToken = await JWT.tokenValido();
      var Rol = await VerificarRol.validarRol();
      setState(() {
        this.isValidToken = isValidToken;
        this.Rol = Rol;
        // if(isValidToken.toString() == 'true')
        //   isCloseSession = false;
      });
  }

  Actualizar(){
    setState(() {
      isCloseSession = false;
    });
  }

  @override
  Widget build(BuildContext context){
    Actualizar();
    return !isCloseSession ? Manejador() : Login();
  }

  Manejador(){
    GetValidaciones();
    if(isValidToken.toString() == 'true'){
      switch(Rol){
        case 1:
          return Administrador();
        case 2:
          return Usuario();
        case 3:
          return Empresa();
        default:
          return const Login();
      }
    }
    return const Login();
  }

  Usuario(){
    return Scaffold(
        appBar: AppBar(
          title: const Text(
          "Perfil",
          style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body:  SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                child:TextButton(
                  onPressed: () async => {
                    await ManageSecureStorage.deleteToken(),
                    setState((){
                      isCloseSession = true;
                      // Manejador();
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
  Empresa(){
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
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
              child:TextButton(
                onPressed: () async => {
                  await ManageSecureStorage.deleteToken(),
                  setState((){
                    isCloseSession = true;
                    // Manejador();
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
  Administrador(){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
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
              child:TextButton(
                onPressed: () async => {
                  await ManageSecureStorage.deleteToken(),
                  setState((){
                    // Manejador();
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