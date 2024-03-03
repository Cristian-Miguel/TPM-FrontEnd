import 'dart:convert';
import 'package:crypto/crypto.dart';

class Encriptar {
  static encriptarPassword(String password, String value) {
    var key = utf8.encode(password);
    var bytes = utf8.encode(value);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    return digest.toString().substring(0, 49);
    // print("HMAC digest as bytes: ${digest.bytes}");
    // print("HMAC digest as hex string: $digest");
  }
}
