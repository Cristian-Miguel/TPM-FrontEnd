import 'package:http/http.dart' as http;
import 'package:turismo_flutter/config/constants/https_routes.dart';
import 'package:turismo_flutter/middleware/manage_secure_storage.dart';
import 'dart:convert';

class GoogleAuthController {
  static postGoogleAuthSignUp(var idToken) async {
    try {
      var url = Uri.parse(RoutesHTTP.rutaSigninGoogle);
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

  static postGoogleAuthSignIn(var idToken) async {
    try {
      var url = Uri.parse(RoutesHTTP.rutaLoginGoogle);
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
