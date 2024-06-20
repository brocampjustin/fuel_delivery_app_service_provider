import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/constants/color/colorpellet.dart';

class ErrorSankeBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnakeBar(
      {required BuildContext context, required String err}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        err.toString(),
      ),
      backgroundColor: colorPellet.primaryColor,
    ));
  }
}
