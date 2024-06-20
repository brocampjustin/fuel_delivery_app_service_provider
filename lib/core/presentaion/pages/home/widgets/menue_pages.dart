import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/add_new_service_screen.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/registar_serviceprovider_widget.dart';

class MenuePages {
  static List<Widget> menuePagesList = [
    Expanded(
      flex: 10,
      child: Container(
        color: Colors.blue,
      ),
    ),
    AddNewServiceScreen(),
    Expanded(
      flex: 10,
      child: Container(
        color: Colors.orange,
      ),
    ),
    Expanded(
      flex: 10,
      child: Container(
        color: Colors.cyan,
      ),
    ),
  ];

  static List<Widget> notRegisterdPageList = [
    RegisterServices(),
  ];
  static List<Widget> RegistedList = [
    Expanded(
      flex: 10,
      child: Container(
        child: Center(
          child: Text(
              "Your  Requst is Submited. Profile will be updated after\n Admin Acept Your Request"),
        ),
        color: Colors.orange,
      ),
    )
  ];
}
