import 'package:turismo_flutter/middleware/ManageSecureStorage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class VerificarRol {
  static validarRol() async{
    var Token = await ManageSecureStorage.getToken();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(Token.toString());
    return decodedToken["idRol"];
  }
}
