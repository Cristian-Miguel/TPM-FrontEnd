import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GoogleSignInAPI {
  static final _googleSignIn = GoogleSignIn(
    clientId: dotenv.env['GOOGLE_CLIENT_ID'],
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/userinfo.profile',
      // 'https://www.googleapis.com/auth/user.birthday.read',
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
