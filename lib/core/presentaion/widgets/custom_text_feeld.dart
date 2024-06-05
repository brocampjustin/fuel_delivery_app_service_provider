import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/constants/reg_exp_validate.dart';

class CustomTextFeeld extends StatelessWidget {
final  String validMessage;
 final String hintText;
 final String labelText;
 final Icon prfixIcon;
 final TextEditingController controller;
 const CustomTextFeeld({
    required this.controller,
    required this.validMessage,
    super.key,
    required this.hintText,
    required this.labelText,
    required this.prfixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          // add email validation
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }

          bool emailValid =
              RegExp(RegExpValidate.regExpValidate).hasMatch(value);
          if (!emailValid) {
            // return 'Please enter a valid email';
            return validMessage;
          }

          return null;
        },
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodySmall,
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prfixIcon,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
