import 'package:http/http.dart' as http;
import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'dart:convert';

class AuthController {
  // var routeMovil = 'http://10.0.2.2:4040/Auth/login';

  static postLogin(var email, var password) async {
    try {
      const routeWeb = 'http://localhost:4040/Auth/login';
      var url = Uri.parse(routeWeb);
      var request = {'Email': '$email', 'Password': '$password'};
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
        body: json.encode(request),
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
