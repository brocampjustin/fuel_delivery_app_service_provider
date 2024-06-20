import 'package:flutter/material.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    print("this is Home page");
    return const Scaffold(
      backgroundColor:  Colors.purple,
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
