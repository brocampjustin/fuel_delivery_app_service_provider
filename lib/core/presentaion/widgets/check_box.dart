import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxWidget extends StatefulWidget {
  bool rememberMe;
  CheckBoxWidget({super.key, required this.rememberMe});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      child: CheckboxListTile(
        value: widget.rememberMe,
        onChanged: (value) {
          if (value == null) return;
          setState(() {
            widget.rememberMe = value;
          });
        },
        title: const Text('Remember me'),
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
        contentPadding: const EdgeInsets.all(0),
      ),
    );
  }
}
