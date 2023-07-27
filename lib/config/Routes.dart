import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:turismo_flutter/components/Plantilla.dart';
import 'package:turismo_flutter/views/Descubrir.dart';
import 'package:turismo_flutter/views/HomePage.dart';
import 'package:turismo_flutter/views/Login.dart';
import 'package:turismo_flutter/views/Mensajes.dart';
import 'package:turismo_flutter/views/OlvidarContrasena.dart';
import 'package:turismo_flutter/views/Perfil.dart';
import 'package:turismo_flutter/views/Reservas.dart';
import 'package:turismo_flutter/views/SingIn.dart';

class RouteManager {
  //Rutas
  static const String Homepage_Route = '/';
  static const String Descubrir_Route = '/Descubrir';
  static const String Reservas_General_Route = '/Reservas_General';
  static const String Reservas_Usuario_Route = '/Reservas_Usuario';
  static const String Mensajes_Route = '/Mensajes_Usuario';
  static const String Perfil_Empresa_Route = '/Perfil_Empresa';
  static const String Perfil_Usuario_Route = '/Perfil_Usuario';
  static const String Login_Route = '/Login_Usuario';
  static const String SingIn_Route = '/Crear_Usuario';
  static const String Olvidar_Contrasena_Route = '/Olvido_Contrasena_Usuario';

  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    switch (settings.name)
    {
      case Homepage_Route:
        return MaterialPageRoute(builder: (context) => const Plantilla(),);
      case Descubrir_Route:
        return MaterialPageRoute(builder: (context) => const Descubrir(),);
      case Reservas_General_Route:
        return MaterialPageRoute(builder: (context) => const Reservas(),);
      case Reservas_Usuario_Route:
        middleware();
        return MaterialPageRoute(builder: (context) => const Reservas(),);
      case Mensajes_Route:
        middleware();
        return MaterialPageRoute(builder: (context) => const Mensajes(),);
      case Perfil_Empresa_Route:
        middleware();
        var Rol = extraerRol();
        if(Rol == 1)
          return MaterialPageRoute(builder: (context) => const Perfil(),);
        else
          return MaterialPageRoute(builder: (context) => const HomePage(),);
      case Perfil_Usuario_Route:
        middleware();
        var Rol = extraerRol();
        if(Rol == 2)
          return MaterialPageRoute(builder: (context) => const Perfil(),);
        else
          return MaterialPageRoute(builder: (context) => const HomePage(),);
      case Login_Route:
        return MaterialPageRoute(builder: (context) => const Login(),);
      case SingIn_Route:
        return MaterialPageRoute(builder: (context) => const SingIn(),);
      case Olvidar_Contrasena_Route:
        return MaterialPageRoute(builder: (context) => const OlvidarContrasena(),);
      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }

  static middleware () async {
    final storage = new FlutterSecureStorage();
    String Token = await storage.read(key: "JWT").toString();
    if(Token == null){
      return MaterialPageRoute(builder: (context) => const Login(),);
    } else {
      bool isTokenExpired = JwtDecoder.isExpired(Token);
      if (isTokenExpired)
        return MaterialPageRoute(builder: (context) => const Login(),);
    }
  }

  static extraerRol () async {
    final storage = new FlutterSecureStorage();
    String Token = await storage.read(key: "JWT").toString();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(Token);
    return decodedToken["Rol"];
  }

}