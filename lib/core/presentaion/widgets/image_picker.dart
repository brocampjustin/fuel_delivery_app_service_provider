import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fuel_delivery_app_service_provider/constants/size.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key,
    required this.controller,
  });

  final MultiImagePickerController controller;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  Future<List<Uint8List>> convertTounit8List(List<ImageFile> images) async {
    List<Uint8List> convertedImages = [];
    for (ImageFile i in images) {
      convertedImages.add(await File(i.path!).readAsBytes());
    }

    return convertedImages;
  }

  List<ImageFile> images = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print("object");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                  TextButton(
                      onPressed: () async {
                        images = await widget.controller.images.toList();
                        print("mu selceted images");

                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text("done"))
                ],
                content: Container(
                  width: 900,
                  child: MultiImagePickerView(
                    controller: widget.controller,
                    padding: const EdgeInsets.all(
                        10), // Optional padding around the picker
                  ),
                ),
              );
            },
          );
          ;
        },
        child: Stack(
          children: [
            images.isEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: DottedBorder(
                      strokeWidth: 5,
                      // dashPattern: [18, 8],
                      color: Colors.grey,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(
                          20), // Adjusts the radius for rounded corners
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        width: 200,
                        height: 100,
                        child: Center(
                          child: Container(
                            width: 80,
                            height: 50,
                            color: Colors.white,
                            child: Center(
                                child: FaIcon(
                              FontAwesomeIcons.solidImages,
                              size: AppSize.gap20,
                            )),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: MemoryImage(images[0].bytes!))),
                  ),
            Positioned(
              top: 1,
              right: 1,
              child: IconButton(
                  tooltip: "Uplod serevice Center Images",
                  onPressed: () {},
                  icon: Icon(
                    Icons.info_outline_rounded,
                  )),
            )
          ],
        ));
  }
}
