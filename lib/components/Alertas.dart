import 'package:flutter/material.dart';

class Alertas {
  final textoAlerta;
  final indexAlerta;
  const Alertas({this.textoAlerta, this.indexAlerta});

  generarAlerta(context) {
    switch (indexAlerta) {
      case 0: //* Alerta de error
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(textoAlerta),
                ),
              ],
            ),
            backgroundColor: Colors.red,
          ),
        );
      case 1: //* warning
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(
                  Icons.warning_amber,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(textoAlerta),
                ),
              ],
            ),
            backgroundColor: Colors.amber,
          ),
        );
      case 2: //* info
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(textoAlerta),
                ),
              ],
            ),
            backgroundColor: Colors.black54,
          ),
        );
      case 3: //* success
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(textoAlerta),
                ),
              ],
            ),
            backgroundColor: Colors.lightGreen,
          ),
        );
      default:
        return null;
    }
  }
}
