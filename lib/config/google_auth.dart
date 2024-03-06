import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:turismo_flutter/config/constants/index.dart';

class GoogleAuthAPI {
  static final _googleSignIn = GoogleSignIn(
    clientId: dotenv.env['GOOGLE_CLIENT_ID'],
    scopes: [
      'email',
      MainConstant.apiGoogleEmailUrl,
      MainConstant.apiGoogleProfileUrl,
    ],
  );

  static Future login() async {
    try {
      final resultsilece = await _googleSignIn.signInSilently();
      if (resultsilece == null) {
        final result = await _googleSignIn.signIn();
        if (result != null) {
          final googleAuth = await result.authentication;
          var idToken = googleAuth.idToken;
          // print('1-----------------------------------------------');
          // print(idToken);
          return idToken;
        }
      } else {
        final googleAuth = await resultsilece.authentication;
        var idToken = googleAuth.idToken;
        // print('2-----------------------------------------------');
        // print(idToken);
        return idToken;
      }
    } catch (error) {
      print(error);
    }
  }
}
