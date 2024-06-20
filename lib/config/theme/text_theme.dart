import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/config/styles/text_styles.dart';
import 'package:fuel_delivery_app_service_provider/constants/color/colorpellet.dart';

class AppTextTheme {
  //Simple text theme
  static TextTheme get lightTextTheme {
    return TextTheme(
      titleLarge:
          AppTextStyles.titleLarge.copyWith(color: colorPellet.blackColor),
      titleMedium:
          AppTextStyles.titleMedium.copyWith(color: colorPellet.blackColor),
      titleSmall:
          AppTextStyles.titleSmall.copyWith(color: colorPellet.blackColor),
      bodyLarge:
          AppTextStyles.bodyLarge.copyWith(color: colorPellet.blackColor),
      bodyMedium:
          AppTextStyles.bodyMedium.copyWith(color: colorPellet.blackColor),
      bodySmall:
          AppTextStyles.bodySmall.copyWith(color: colorPellet.blackColor),
    );
  }

  //Dark text theme
  static TextTheme get darkTextTheme {
    return TextTheme(
      
      // labelMedium: lable,
      titleLarge:
          AppTextStyles.titleLarge.copyWith(color: colorPellet.blackColor),
      titleMedium:
          AppTextStyles.titleMedium.copyWith(color: colorPellet.blackColor),
      titleSmall:
          AppTextStyles.titleSmall.copyWith(color: colorPellet.blackColor),
      bodyLarge:
          AppTextStyles.bodyLarge.copyWith(color: colorPellet.blackColor),
      bodyMedium:
          AppTextStyles.bodyMedium.copyWith(color: colorPellet.blackColor),
      bodySmall:
          AppTextStyles.bodySmall.copyWith(color: colorPellet.blackColor),
    );
  }
}
