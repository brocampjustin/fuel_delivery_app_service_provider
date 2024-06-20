import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/config/styles/text_styles.dart';
import 'package:fuel_delivery_app_service_provider/config/theme/elevated_button_style.dart';
import 'package:fuel_delivery_app_service_provider/config/theme/text_theme.dart';

import '../../constants/color/colorpellet.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        buttonTheme: ButtonThemeData(buttonColor: Colors.red),
        primaryColorLight: colorPellet.primaryColor,
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: AppButtonStyle.button1),
        brightness: Brightness.light,
        primaryColor: colorPellet.primaryColor,
        colorScheme: ColorScheme.light(background: colorPellet.whiteColor),
        scaffoldBackgroundColor: colorPellet.whiteColor,
        primaryTextTheme: AppTextTheme.lightTextTheme,
        textTheme: AppTextTheme.lightTextTheme,
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: colorPellet.whiteColor,
            titleTextStyle: AppTextStyles.titleMedium),
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.white, shadowColor: colorPellet.blackColor),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ));
  }

  // static ThemeData get darkTheme {
  //   return ThemeData(
  //       brightness: Brightness.dark,
  //       primaryColor: AppColors.primaryDark,
  //       colorScheme: const ColorScheme.dark(
  //           primary: AppColors.primaryDark,
  //           secondary: AppColors.secondaryDark,
  //           error: AppColors.error,
  //           background: AppColors.backgroundDark),
  //       scaffoldBackgroundColor: AppColors.backgroundDark,
  //       primaryTextTheme: AppTextTheme.darkTextTheme,
  //       textTheme: AppTextTheme.darkTextTheme,
  //       appBarTheme: AppBarTheme(
  //           elevation: 0,

  //           backgroundColor: AppColors.backgroundDark,
  //           titleTextStyle: AppTextStyles.titleMedium),
  //       bottomSheetTheme: const BottomSheetThemeData(
  //           backgroundColor: AppColors.bottomSheetDark,
  //           shadowColor: AppColors.bottomSheetShadowDark),
  //       drawerTheme: const DrawerThemeData(
  //           backgroundColor: AppColors.drawerDark,
  //           shadowColor: AppColors.drawerShadowDark),
  //       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //         backgroundColor: AppColors.backgroundDark,
  //       ));
  // }
}
