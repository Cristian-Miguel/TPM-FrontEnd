import 'package:turismo_flutter/middleware/manage_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CheckRol {
  static validRol() async {
    var token = await ManageSecureStorage.getToken();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    return decodedToken["idRol"];
  }
}
