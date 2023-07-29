import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class JWT {
  static tokenValido() async {
    var token = await ManageSecureStorage.getToken();
    if (token == null) {
      return "false";
    } else {
      bool isTokenExpired = JwtDecoder.isExpired(token.toString());
      return (!isTokenExpired).toString();
    }
  }
}
