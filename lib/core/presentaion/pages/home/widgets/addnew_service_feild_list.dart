import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/custom_text_feeld.dart';

class AddnewServiceFeildList {
  static List<Widget> getAddNewServiceFeildList(
    TextEditingController titleController,
  ) {
    return [
      CustomTextFeeld(
          controller: titleController,
          validMessage: "hellow",
          hintText: "Enter Service Title",
          labelText: "Service Name",
          prfixIcon: Icon(Icons.abc)),
      CustomTextFeeld(
          controller: titleController,
          validMessage: "hellow",
          hintText: "Enter Service Title",
          labelText: "Service Name",
          prfixIcon: Icon(Icons.abc)),
      CustomTextFeeld(
          controller: titleController,
          validMessage: "hellow",
          hintText: "Enter Service Title",
          labelText: "Service Name",
          prfixIcon: Icon(Icons.abc)),
      CustomTextFeeld(
          controller: titleController,
          validMessage: "hellow",
          hintText: "Enter Service Title",
          labelText: "Service Name",
          prfixIcon: Icon(Icons.abc)),
      CustomTextFeeld(
          controller: titleController,
          validMessage: "hellow",
          hintText: "Enter Service Title",
          labelText: "Service Name",
          prfixIcon: Icon(Icons.abc)),
      CustomTextFeeld(
          controller: titleController,
          validMessage: "hellow",
          hintText: "Enter Service Title",
          labelText: "Service Name",
          prfixIcon: Icon(Icons.abc)),
    ];
  }
}
