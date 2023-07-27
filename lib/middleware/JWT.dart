import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class JWT {
  static tokenValido() async {
    var Token = await ManageSecureStorage.getToken();
    if(Token == null){
      return "false";
    } else {
      bool isTokenExpired = JwtDecoder.isExpired(Token.toString());
      return (!isTokenExpired).toString();
    }
  }
}