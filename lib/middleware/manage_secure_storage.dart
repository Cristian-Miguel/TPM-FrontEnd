import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ManageSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyJWT = 'JWT';

  static Future setToken(String token) async => await _storage.write(
      key: _keyJWT, value: token, aOptions: _getAndroidOptions());

  static Future<String?> getToken() async => await _storage.read(key: _keyJWT);

  static Future deleteToken() async => await _storage.delete(key: _keyJWT);

  static _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
