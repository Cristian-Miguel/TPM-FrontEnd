import 'package:flutter/material.dart';
import 'package:turismo_flutter/views/Login.dart';

class OlvidarContrasena extends StatefulWidget {
  const OlvidarContrasena({super.key});
  @override
  State<OlvidarContrasena> createState() => OlvidarContrasenaState();
}

class OlvidarContrasenaState extends State<OlvidarContrasena> {
  final _emailInputTextController = TextEditingController();
  bool isExit = false;

  @override
  Widget build(BuildContext context) {
    return isExit ? Login() : OlvidarContrasenaView();
  }

  OlvidarContrasenaView(){
    return SingleChildScrollView(
      child: Form(
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 220, 0, 20),
                  child: Text('Restablecer contraseña', style: Theme.of(context).textTheme.headlineMedium,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
                  child: TextFormField(
                    controller: _emailInputTextController,
                    decoration: const InputDecoration(hintText: 'Ingrese su correo'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: TextButton(
                    onPressed: () => {
                      _emailInputTextController,
                      setState(() { isExit = true; })
                    },
                    child: const Text('Restablecer'),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                        return Size(300, 20);
                      }),
                      foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled) ? null : Colors.white;
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled) ? null : const Color.fromRGBO(255, 55, 92, 1.0);
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextButton(
                    onPressed: () => { setState(() { isExit = true; }) },
                    child: const Text('Omitir'),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                        return Size(300, 20);
                      }),
                      foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled) ? null : Colors.black;
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled) ? null : Colors.black12;
                      }),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

}