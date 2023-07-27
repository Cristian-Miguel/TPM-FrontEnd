import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ManageSecureStorage {
  static final storage = FlutterSecureStorage();

  static const keyJWT = 'JWT';

  static Future setToken(String token) async =>
      await storage.write(key: keyJWT, value: token);

  static Future<String?> getToken() async =>
      await storage.read(key: keyJWT);

  static Future deleteToken() async =>
      await storage.delete(key: keyJWT);

}