import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PassWordFeeld extends StatefulWidget {
   PassWordFeeld({super.key,required this.controller});

  TextEditingController controller;
  @override
  State<PassWordFeeld> createState() => _PassWordFeeldState();
}

class _PassWordFeeldState extends State<PassWordFeeld> {

  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      child: TextFormField(
        controller:widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }

          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.bodySmall,
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )),
      ),
    );
  }
}
