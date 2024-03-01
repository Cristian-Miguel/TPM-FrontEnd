import 'package:flutter/material.dart';

class Error {
  final String textAlert;

  Error(this.textAlert);

  getErrorFormat(context) {
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
        backgroundColor: Colors.red,
      ),
    );
  }
}
