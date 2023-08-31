import 'package:flutter_dotenv/flutter_dotenv.dart';

class RutasHTTP {
  static final String url = dotenv.env['SERVER_HTTP_WEB'].toString();

  //* Rutas para autenticar
  static final String rutaLogin = '$url/Auth/login';
  static final String rutaSignin = '$url/Auth/SignIn';
  static final String rutaSigninGoogle = '$url/Auth/Google_SignIn';
  static final String rutaLoginGoogle = '$url/Auth/Google_LogIn';

  //* Rutas para usuario
  static final String rutaInfoUsuario = '$url/Usuario/info';

  //* Rutas para mensajes

  //* Rutas para reservas

  //* Rutas para descubrir
}
