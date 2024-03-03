import 'package:http/http.dart' as http;
import 'package:turismo_flutter/config/constants/https_routes.dart';
import 'package:turismo_flutter/middleware/manage_secure_storage.dart';
import 'dart:convert';

class SignUpController {
  static postSignUp(var infoRegistro) async {
    try {
      var url = Uri.parse(RutasHTTP.rutaSignin);
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
        body: json.encode(infoRegistro),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var token = json.decode(response.body)['token'];
        await ManageSecureStorage.setToken(token);
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } catch (error) {
      return 500;
    }
  }
}
