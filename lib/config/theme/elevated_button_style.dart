import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuel_delivery_app_service_provider/config/styles/text_styles.dart';

import 'package:fuel_delivery_app_service_provider/constants/color/colorpellet.dart';

class AppButtonStyle {
  static final button1 = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(colorPellet.primaryColor),
    foregroundColor: WidgetStatePropertyAll(colorPellet.white),
  );
}
