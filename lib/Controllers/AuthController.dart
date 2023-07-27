import 'package:http/http.dart' as http;
import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'dart:convert';

class AuthController{

  static postLogin( var Email, var Password) async{
    var url = Uri.parse('http://10.0.2.2:4040/Auth/login');
    var request = {
      'Email': '$Email',
      'Password': '$Password'
    };
    var response = await http.post(
        url,
        headers: {"Content-Type": "application/json; charset=utf-8",},
        body: json.encode(request)
    );
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    var token = json.decode(response.body)['token'];
    await ManageSecureStorage.setToken(token);

  }
}