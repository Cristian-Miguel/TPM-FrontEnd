import 'package:turismo_flutter/config/RutasHTTP.dart';
import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioController {
  static getUsuario() async {
    var url = Uri.parse(RutasHTTP.rutaInfoUsuario);
    var token = await ManageSecureStorage.getToken();
    var response = await http.get(url, headers: {
      "Content-Type": "application/json; charset=utf-8",
      "authorization": '$token',
    });
    var infoUsuario = json.decode(response.body);
    return response.statusCode == 200
        ? infoUsuario['data']
        : response.statusCode;
  }

  deleteUsuario(int i) {}

  updateUsuario(var jsonUpdateUsuario) {}
}
