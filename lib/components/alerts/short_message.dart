import 'package:flutter/material.dart';

class GenericMessage {
  final IconData icon;
  final Color color;
  final String textAlert;

  GenericMessage(this.icon, this.color, this.textAlert);

  getMessageFormat(context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(textAlert),
            ),
          ],
        ),
        backgroundColor: color,
      ),
    );
  }
}
