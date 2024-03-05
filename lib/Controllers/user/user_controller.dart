import 'package:turismo_flutter/config/constants/https_routes.dart';
import 'package:turismo_flutter/middleware/manage_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserController {
  static getUser() async {
    var url = Uri.parse(RoutesHTTP.rutaInfoUsuario);
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

  deleteUser(int i) {}

  updateUser(var jsonUpdateUsuario) {}
}
