import 'package:flutter/material.dart';
import 'package:turismo_flutter/components/alerts/short_message.dart';

class Alerts {
  final String textAlert;
  final int indexAlert;

  Alerts(this.textAlert, this.indexAlert);

  generateAlerts(context) {
    switch (indexAlert) {
      case 0: //* Alerta de error
        return GenericMessage(Icons.error_outline, Colors.red, textAlert)
            .getMessageFormat(context);
      case 1: //* warning
        return GenericMessage(Icons.warning_amber, Colors.amber, textAlert)
            .getMessageFormat(context);
      case 2: //* info
        return GenericMessage(Icons.info_outline, Colors.black54, textAlert)
            .getMessageFormat(context);
      case 3: //* success
        return GenericMessage(
                Icons.check_circle_outline, Colors.lightGreen, textAlert)
            .getMessageFormat(context);
      default:
        return null;
    }
  }
}
