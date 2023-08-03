import 'package:flutter/material.dart';
import 'package:turismo_flutter/config/Encriptar.dart';
import 'package:turismo_flutter/config/ValidarCampos.dart';
import 'package:turismo_flutter/views/Login.dart';
import 'package:turismo_flutter/views/Perfil.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});
  @override
  State<SingIn> createState() => SingInState();
}

class SingInState extends State<SingIn> {
  final _emailInputTextController = TextEditingController();
  final _confirmarPasswordInputTextController = TextEditingController();
  final _passwordInputTextController = TextEditingController();
  final _usuarioInputTextController = TextEditingController();
  final _nombreInputTextController = TextEditingController();
  final _apellidoPaternoInputTextController = TextEditingController();
  final _apellidoMaternoInputTextController = TextEditingController();
  final _fechaNacInputTextController = TextEditingController();
  final _rfcInputTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _imagen = "a";
  int indexPage = 0;
  bool isSingIn = true;

  final List<Widget> widgetsChildren = [
    const Perfil(),
    const Login(),
  ];

  postRegistro() {
    if (_formKey.currentState!.validate()) {
      var encriptado = Encriptar.encriptarPassword(
          _emailInputTextController.text, _passwordInputTextController.text);
      var registroJson = {
        "Email": _emailInputTextController.text,
        "Usuario": _usuarioInputTextController.text,
        "Password": encriptado,
        "Nombre": _nombreInputTextController.text,
        "ApPaterno": _apellidoPaternoInputTextController.text,
        "ApMaterno": _apellidoMaternoInputTextController.text,
        "FechaNac": _fechaNacInputTextController.text,
        "RFC": _rfcInputTextController.text,
        "Imagen": _imagen
      };
      setState(() {
        isSingIn = false;
        indexPage = 0;
      });
    }
  }

  @override
  void dispose() {
    _emailInputTextController.dispose();
    _passwordInputTextController.dispose();
    _usuarioInputTextController.dispose();
    _confirmarPasswordInputTextController.dispose();
    _nombreInputTextController.dispose();
    _apellidoPaternoInputTextController.dispose();
    _apellidoPaternoInputTextController.dispose();
    _emailInputTextController.dispose();
    _rfcInputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isSingIn ? singInView() : widgetsChildren[indexPage];
  }

  singInView() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 5),
            child: Text(
              'Registra cuenta',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: TextButton(
              onPressed: () =>
                  {_emailInputTextController, _passwordInputTextController},
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
          //* Usuario
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextFormField(
              controller: _usuarioInputTextController,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              validator: (value) {
                return (value == null || value.isEmpty) ? 'Campo vacio' : null;
              },
            ),
          ),
          //* Correo
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextFormField(
              controller: _emailInputTextController,
              decoration: const InputDecoration(
                labelText: 'Correo',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo vacio';
                if (ValidarCampos.validarCorreo(value))
                  return 'Ingrese un correo';
                return null;
              },
            ),
          ),
          //* Contraseña
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextFormField(
              controller: _passwordInputTextController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo vacio';
                if (value.length < 8)
                  return 'Debe contener minimo 8 caracteres';
                if (ValidarCampos.validarPassword(value))
                  return 'La contraseña debe tener minimo 1 mayuscula, 1 minuscula, 1 numero y 1 cararacter especial';
                return null;
              },
            ),
          ),
          //* Confirmar Contraseña
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextFormField(
              controller: _confirmarPasswordInputTextController,
              decoration: const InputDecoration(
                labelText: 'Confirmar contraseña',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo vacio';
                if (value.length < 8)
                  return 'Debe contener minimo 8 caracteres';
                if (ValidarCampos.validarPassword(value))
                  return 'La contraseña debe tener minimo 1 mayuscula, 1 minuscula, 1 numero y 1 cararacter especial';
                return null;
              },
            ),
          ),
          //* Nombre
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextFormField(
              controller: _nombreInputTextController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              validator: (value) {
                return (value == null || value.isEmpty) ? 'Campo vacio' : null;
              },
            ),
          ),
          //* Apellido Paterno
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextFormField(
              controller: _apellidoPaternoInputTextController,
              decoration: const InputDecoration(
                labelText: 'Apellido paterno',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              validator: (value) {
                return (value == null || value.isEmpty) ? 'Campo vacio' : null;
              },
            ),
          ),
          //* Apellido Materno
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextFormField(
              controller: _apellidoMaternoInputTextController,
              decoration: const InputDecoration(
                labelText: 'Apellido materno',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              validator: (value) {
                return (value == null || value.isEmpty) ? 'Campo vacio' : null;
              },
            ),
          ),
          //* fecha de nacimiento
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: TextFormField(
              controller: _fechaNacInputTextController,
              decoration: const InputDecoration(hintText: 'Fecha Nacimiento'),
            ),
          ),
          //* RFC
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextFormField(
              controller: _rfcInputTextController,
              decoration: const InputDecoration(
                labelText: 'RFC',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              validator: (value) {
                return (value == null || value.isEmpty) ? 'Campo vacio' : null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 20, 30, 20),
                child: TextButton(
                  onPressed: () => {
                    _emailInputTextController,
                    _passwordInputTextController,
                    setState(() {
                      isSingIn = false;
                      indexPage = 1;
                    })
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return const Size(100, 40);
                    }),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : Colors.black54;
                    }),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : Colors.transparent;
                    }),
                  ),
                  child: const Text('Cancelar'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 5, 20),
                child: TextButton(
                  onPressed: postRegistro,
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return const Size(180, 40);
                    }),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : Colors.white;
                    }),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : const Color.fromRGBO(255, 55, 92, 1.0);
                    }),
                  ),
                  child: const Text('Registrar cuenta'),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
