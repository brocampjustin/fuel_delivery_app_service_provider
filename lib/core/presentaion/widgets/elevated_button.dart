import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/constants/size.dart';

class CustomElevetedButton1 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VoidCallback buttonFunction;
  final String buttonText;

  const CustomElevetedButton1(
      {super.key,
      required this.formKey,
      required this.buttonFunction,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        onPressed: buttonFunction,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class CustomElevetedButton2 extends StatelessWidget {
  final VoidCallback buttonFunction;
  final String buttonText;

  const CustomElevetedButton2(
      {super.key, required this.buttonFunction, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 440, minHeight: 44),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        onPressed: buttonFunction,
        child: Padding(
          padding: const EdgeInsets.all(AppSize.gap10),
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}
