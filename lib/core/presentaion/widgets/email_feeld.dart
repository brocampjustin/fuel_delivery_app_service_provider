
import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/constants/reg_exp_validate.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/pdfmodel.dart';

class EmailFeild extends StatelessWidget {
  TextEditingController controller;
  IconData prefinxIcon;
  String labelText;
  String hintText;
  EmailFeild({
    required this.prefinxIcon,
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

  
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      child: TextFormField(
        controller: controller,
        validator: (value) {
        
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }

          bool emailValid =
              RegExp(RegExpValidate.regExpValidate).hasMatch(value);
          if (!emailValid) {
            return 'Please enter a valid $labelText';
          }

          return null;
        },
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodySmall,
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(prefinxIcon),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
