import 'package:http/http.dart' as http;
import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthController {
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

  static postGoogleAuth(var idToken) async {
    try {
      var mainRoute = dotenv.env['SERVER_HTTP_WEB'];
      // final routeWeb = '$mainRoute/Auth/login';
      var url = Uri.parse('$mainRoute/Auth/Google_SignIn');
      var request = {'Auth': '$idToken'};
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
