import 'package:flutter/material.dart';

class DesktopHome extends StatelessWidget {
  const DesktopHome({super.key});

  @override
  Widget build(BuildContext context) {
    print("this is Home page");

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
