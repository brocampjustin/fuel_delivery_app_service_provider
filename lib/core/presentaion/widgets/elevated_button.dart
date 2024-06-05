import 'package:flutter/material.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: buttonFunction,
      ),
    );
  }
}
