import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/constants/size.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/registar_serviceprovider_widget.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/service_lsit_grid_view_builder.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/custom_textfeild_1.dart';
import 'package:gap/gap.dart';

class AddServieceFeild extends StatefulWidget {
  TextEditingController servceItemController;
  List<String> services;
  AddServieceFeild(
      {Key? key, required this.servceItemController, required this.services})
      : super(key: key);

  @override
  State<AddServieceFeild> createState() => _AddServieceFeildState();
}

class _AddServieceFeildState extends State<AddServieceFeild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          height: 50,
          child: ServiceGridBuilder(services: widget.services),
        ),
        Gap(AppSize.gap30),
        AddServiceTextFeild(
          onsubmited: (String s) {
            if (widget.servceItemController.text.length > 0) {
              widget.services.add(s);
              widget.servceItemController.clear();
              setState(() {});
            }
          },
          hintText: "Enter Services...",
          lable: "Services",
          textEditingController: widget.servceItemController,
          width: AppSize.textFeildWidth2,
          prefixIcon: Icons.storefront,
        ),
      ],
    );
  }
}