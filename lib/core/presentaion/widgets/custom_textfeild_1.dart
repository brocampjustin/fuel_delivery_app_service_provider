import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/constants/size.dart';

class CustomTextFeeld1 extends StatelessWidget {
  TextEditingController textEditingController;
  String lable;
  String hintText;
  double width;
  IconData prefixIcon;
  CustomTextFeeld1(
      {required this.hintText,
      required this.lable,
      required this.textEditingController,
      required this.width,
      super.key,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: lable,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            prefixIcon: Icon(prefixIcon),
          )),
    );
  }
}

class DropdownTextField extends StatelessWidget {
  DropdownTextField(
      {Key? key,
      required this.prefixIcon,
      required this.width,
      required this.itemList,
      required this.lableText})
      : super(key: key);
  List<String> itemList = [];
  final double width;
  final IconData prefixIcon;
  String lableText;
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> dropDownList = itemList
        .map(
          (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
        )
        .toList();
    return SizedBox(
// Replace with your AppSize.gap30 if defined
      width: width,
      child: DropdownButtonFormField<String>(
        items: dropDownList,
        onChanged: (val) {},
        decoration: InputDecoration(
          labelText: lableText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          prefixIcon: Icon(prefixIcon),
        ),
      ),
    );
  }
}

class CustomPhoneFeild extends StatelessWidget {
  TextEditingController textEditingController;
  String lable;
  String hintText;
  double width;
  IconData prefixIcon;
  int maxLength;
  CustomPhoneFeild(
      {required this.hintText,
      required this.lable,
      required this.textEditingController,
      required this.width,
      super.key,
      required this.prefixIcon,
      required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
          maxLength: maxLength,
          keyboardType: TextInputType.number,
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: lable,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            prefixIcon: Icon(prefixIcon),
          )),
    );
  }
}

class AddressFeild extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final String hintText;
  final double width;
  final IconData prefixIcon;
  TextEditingController? mapController;

  AddressFeild({
    this.mapController,
    required this.hintText,
    required this.label,
    required this.textEditingController,
    required this.width,
    required this.prefixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        width: width,
        child: TextField(
          onTap: () {
            textEditingController.text = mapController?.text ?? "";
          },
          textAlign: TextAlign.start,
          maxLines: 4,
          controller: textEditingController,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: label,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),

            // prefixIcon: Icon(prefixIcon),
            filled: true,
            fillColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          ),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class AddServiceTextFeild extends StatelessWidget {
  TextEditingController textEditingController;
  String lable;
  String hintText;
  double width;
  IconData prefixIcon;
  Function onsubmited;

  AddServiceTextFeild(
      {required this.hintText,
      required this.lable,
      required this.textEditingController,
      required this.width,
      super.key,
      required this.prefixIcon,
      required this.onsubmited});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
          onSubmitted: (a) {
            onsubmited(a);
          },
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: lable,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            prefixIcon: Icon(prefixIcon),
          )),
    );
  }
}

class LocationFeild extends StatelessWidget {
  TextEditingController textEditingController;
  String lable;
  String hintText;
  double width;
  IconData prefixIcon;
  LocationFeild(
      {required this.hintText,
      required this.lable,
      required this.textEditingController,
      required this.width,
      super.key,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                // labelText: lable,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                prefixIcon: Icon(prefixIcon),
              )),
          Container(
            width: 300,
            height: 50,
            color: Colors.transparent,
          )
        ],
      ),
    );
  }
}
