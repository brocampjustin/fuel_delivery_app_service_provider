import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class ConvertToUint8List {
  static Future<List<ImageFile>> xFileListToUint8List(List<XFile> images) async {
    List<ImageFile> imageFiles = [];
    for (XFile i in images) {
      Uint8List u8;

      u8 = await i.readAsBytes();
      imageFiles.add(convertXFileToImageFile(i)); //,u8));
    }
    return imageFiles;
  }
}
