import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/config/styles/text_styles.dart';
import 'package:fuel_delivery_app_service_provider/constants/color/colorpellet.dart';



class AppTextTheme {
  //Simple text theme
  static TextTheme get lightTextTheme {
    return TextTheme(
      
      titleLarge:
          AppTextStyles.titleLarge.copyWith(color: ColorPellet.blackColor),
      titleMedium:
          AppTextStyles.titleMedium.copyWith(color: ColorPellet.blackColor),
      titleSmall:
          AppTextStyles.titleSmall.copyWith(color: ColorPellet.blackColor),
      bodyLarge:
          AppTextStyles.bodyLarge.copyWith(color: ColorPellet.blackColor),
      bodyMedium:
          AppTextStyles.bodyMedium.copyWith(color: ColorPellet.blackColor),
      bodySmall:
          AppTextStyles.bodySmall.copyWith(color: ColorPellet.blackColor),
    );
  }

  //Dark text theme
  static TextTheme get darkTextTheme {
    return TextTheme(
      // labelMedium: lable,
      titleLarge:
          AppTextStyles.titleLarge.copyWith(color: ColorPellet.blackColor),
      titleMedium:
          AppTextStyles.titleMedium.copyWith(color: ColorPellet.blackColor),
      titleSmall:
          AppTextStyles.titleSmall.copyWith(color: ColorPellet.blackColor),
      bodyLarge:
          AppTextStyles.bodyLarge.copyWith(color: ColorPellet.blackColor),
      bodyMedium:
          AppTextStyles.bodyMedium.copyWith(color: ColorPellet.blackColor),
      bodySmall:
          AppTextStyles.bodySmall.copyWith(color: ColorPellet.blackColor),
    );
  }
}
