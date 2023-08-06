import 'package:flutter/material.dart';
import 'package:turismo_flutter/config/Encriptar.dart';
import 'package:turismo_flutter/config/ValidarCampos.dart';
import 'package:turismo_flutter/views/Login.dart';
import 'package:turismo_flutter/views/Perfil.dart';
import 'package:intl/intl.dart';

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
  var hiddenPassword1 = true;
  var iconEye1 = const Icon(Icons.visibility);
  var hiddenPassword2 = true;
  var iconEye2 = const Icon(Icons.visibility);

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

  // @override
  // void dispose() {
  //   _emailInputTextController.dispose();
  //   _passwordInputTextController.dispose();
  //   _usuarioInputTextController.dispose();
  //   _confirmarPasswordInputTextController.dispose();
  //   _nombreInputTextController.dispose();
  //   _apellidoPaternoInputTextController.dispose();
  //   _apellidoPaternoInputTextController.dispose();
  //   _emailInputTextController.dispose();
  //   _rfcInputTextController.dispose();
  //   super.dispose();
  // }

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
                if (ValidarCampos.validarRegex(value, 0)) //*validar correo
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
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hiddenPassword1 = (!hiddenPassword1);
                      hiddenPassword1
                          ? iconEye1 = const Icon(Icons.visibility)
                          : iconEye1 = const Icon(Icons.visibility_off);
                    });
                  },
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(0),
                  icon: iconEye1,
                ),
              ),
              obscureText: hiddenPassword1,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo vacio';
                if (ValidarCampos.validarRegex(value, 1))
                  return "La contraseña debe tener minimo: \n 1 Minusculas \n 1 Mayusculas \n 1 Numero \n 1 Caracter especial !@#\$%^&*-_=+()[]{};:'" +
                      '"' +
                      '|<,>./?`~\\ \n Mayor a 8 caracteres\n Menor a 16 caracteres';
                if (value.toString() !=
                    _confirmarPasswordInputTextController.text.toString())
                  return 'Las contraseñas no coinciden';
                return null;
              },
            ),
          ),
          //* Confirmar Contraseña
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextFormField(
              controller: _confirmarPasswordInputTextController,
              decoration: InputDecoration(
                labelText: 'Confirmar contraseña',
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hiddenPassword2 = (!hiddenPassword2);
                      hiddenPassword2
                          ? iconEye2 = const Icon(Icons.visibility)
                          : iconEye2 = const Icon(Icons.visibility_off);
                    });
                  },
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(0),
                  icon: iconEye2,
                ),
              ),
              obscureText: hiddenPassword2,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo vacio';
                if (ValidarCampos.validarRegex(value, 1))
                  return "La contraseña debe tener minimo: \n 1 Minusculas \n 1 Mayusculas \n 1 Numero \n 1 Caracter especial !@#\$%^&*-_=+()[]{};:'" +
                      '"' +
                      '|<,>./?`~\\ \n Mayor a 8 caracteres\n Menor a 16 caracteres';
                if (value.toString() !=
                    _passwordInputTextController.text.toString())
                  return 'Las contraseñas no coinciden';
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
                if (value == null || value.isEmpty) return 'Campo vacio';
                if (ValidarCampos.validarRegex(value, 3))
                  return 'Ingrese solo letras';
                return null;
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
                if (value == null || value.isEmpty) return 'Campo vacio';
                if (ValidarCampos.validarRegex(value, 3))
                  return 'Ingrese solo letras';
                return null;
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
                if (value == null || value.isEmpty) return 'Campo vacio';
                if (ValidarCampos.validarRegex(value, 3))
                  return 'Ingrese solo letras';
                return null;
              },
            ),
          ),
          //* Fecha de nacimiento
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextFormField(
              controller: _fechaNacInputTextController,
              decoration: InputDecoration(
                labelText: 'Fecha de nacimiento',
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context, //context of current state
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        _fechaNacInputTextController.text = formattedDate;
                      });
                    }
                  },
                  icon: const Icon(Icons.date_range),
                  alignment: Alignment.bottomCenter,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo vacio';
                if (ValidarCampos.validarRegex(value, 4))
                  return 'Ingrese una fecha valida con formato yyyy-mm-dd';
                return null;
              },
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
                if (value == null || value.isEmpty) return null;
                if (ValidarCampos.validarRegex(value, 5))
                  return 'Ingrese un RFC valido';
                return null;
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
