import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/constants/color/colorpellet.dart';
import 'package:gap/gap.dart';

import '../../../../../constants/size.dart';
import '../models/menu_model.dart';

class BildMenueEntry extends StatelessWidget {
  int index;
  int selectedIndex;
  bool isSelected;
  List<MenueModel> menueItems;
  BildMenueEntry({
    required this.menueItems,
    required this.selectedIndex,
    required this.index,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
            color: isSelected ? colorPellet.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(7)),
        child: Row(
          children: [
            Gap(AppSize.gap10),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSize.gap10, horizontal: 13),
              child: Icon(menueItems[index].icon,
                  color: isSelected ? colorPellet.white : colorPellet.black),
            ),
            Text(
              menueItems[index].name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isSelected ? colorPellet.white : colorPellet.black),
            )
          ],
        ),
      ),
    );
  }
}
