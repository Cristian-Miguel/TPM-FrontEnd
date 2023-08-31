import 'package:http/http.dart' as http;
import 'package:turismo_flutter/config/RutasHTTP.dart';
import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'dart:convert';

class AuthController {
  static postLogin(var email, var password) async {
    try {
      var url = Uri.parse(RutasHTTP.rutaLogin);
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

  static postSignIn(var infoRegistro) async {
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

  static postGoogleAuthSignIn(var idToken) async {
    try {
      var url = Uri.parse(RutasHTTP.rutaSigninGoogle);
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

  static postGoogleAuthLogIn(var idToken) async {
    try {
      var url = Uri.parse(RutasHTTP.rutaLoginGoogle);
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
