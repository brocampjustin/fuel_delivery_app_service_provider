// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenueModel {
  String name;
  IconData icon;
  MenueModel({
    required this.name,
    required this.icon,
  });
}

class SideMenueData {
  static List<MenueModel> menueItems = [
    MenueModel(name: "Home", icon: Icons.home),
    MenueModel(name: "Add new services", icon: Icons.import_contacts),

    MenueModel(name: "Home", icon: Icons.home),
    MenueModel(name: "Home", icon: Icons.home),


  ];

  static List<MenueModel> notRegisterdmenueItems = [
        MenueModel(name: "Registar ", icon: Icons.logout),
  ];
  static List<MenueModel> notAcptedList = [
            MenueModel(name: "Home", icon: Icons.home),
  ];


}
