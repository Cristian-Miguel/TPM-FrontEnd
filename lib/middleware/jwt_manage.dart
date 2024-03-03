import 'package:turismo_flutter/middleware/manage_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class JwtManage {
  static validToken() async {
    var token = await ManageSecureStorage.getToken();
    if (token == null) {
      return "false";
    } else {
      bool isTokenExpired = JwtDecoder.isExpired(token.toString());
      return (!isTokenExpired).toString();
    }
  }
}
