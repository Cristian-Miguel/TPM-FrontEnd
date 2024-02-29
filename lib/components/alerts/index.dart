import 'package:flutter/material.dart';

class Alerts {
  final String textAlert;
  final int indexAlert;

  Alerts(this.textAlert, this.indexAlert);

  generateAlerts(context) {
    switch (indexAlert) {
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
                  child: Text(textAlert),
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
                  child: Text(textAlert),
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
                  child: Text(textAlert),
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
                  child: Text(textAlert),
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
