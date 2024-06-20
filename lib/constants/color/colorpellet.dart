import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ColorPellet colorPellet = LightColorTheame();

class ColorPellet {

  final Color primaryColor;
  final Color whiteColor;
  final Color primaryLite;
  final Color blackColor;
  final Color white;
  final Color errorColor;
  final Color black;
  final Color transpirant;
  final Color borderColor;
  final Color green;
  final Color textfeeldBorderColor;
  final Color fillColor;
  ColorPellet({
    required this.fillColor,
    required this.primaryColor,
    required this.whiteColor,
    required this.primaryLite,
    required this.blackColor,
    required this.white,
    required this.errorColor,
    required this.black,
    required this.transpirant,
    required this.borderColor,
    required this.green,
    required this.textfeeldBorderColor,
  });
}

class LightColorTheame extends ColorPellet {
  LightColorTheame()
      : super(
            fillColor: Colors.grey,
            primaryColor: HexColor("#5D87FF"),
            whiteColor: Colors.white,
            primaryLite: Color.fromARGB(82, 33, 149, 243),
            blackColor: Colors.black,
            white: Colors.white,
            errorColor: Colors.red,
            black: Colors.black,
            transpirant: Color.fromARGB(0, 255, 255, 255),
            borderColor: HexColor('#D8DADC'),
            green: HexColor("#3A9C15"),
            textfeeldBorderColor: HexColor("#D8DADC"));
}
