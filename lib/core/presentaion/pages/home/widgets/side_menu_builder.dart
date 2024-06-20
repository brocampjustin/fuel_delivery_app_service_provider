import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/registar_serviceprovider_widget.dart';

class MenuePageBuilder extends StatelessWidget {
  int index;
  List<Widget> menuePages;
  MenuePageBuilder({
    required this.menuePages,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return menuePages[index];
  }
}
