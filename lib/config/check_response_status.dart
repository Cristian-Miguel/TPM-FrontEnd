import 'dart:async';
import 'package:flutter/material.dart';
import 'package:turismo_flutter/components/alerts/index.dart';
import 'package:turismo_flutter/config/constants/error_message.dart';
import 'package:turismo_flutter/config/constants/index.dart';

class CheckResponseStatus {
  static Future<void> checkResponse(
      BuildContext context, response, String errorMessage) async {
    if (response == 201 || response == 200) {
      Timer(const Duration(milliseconds: 1500), () {
        Alerts(MainConstant.succesfulMessage, MainConstant.successAlert)
            .generateAlerts(context);
      });
    } else if (response >= 500 && response <= 511) {
      Alerts(
        ErrorMessage.genericError_500,
        MainConstant.errorAlert,
      ).generateAlerts(context);
    } else {
      Timer(const Duration(milliseconds: 1500), () {
        Alerts(
          errorMessage,
          MainConstant.errorAlert,
        ).generateAlerts(context);
      });
    }
  }
}
