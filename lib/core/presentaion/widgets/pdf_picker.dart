import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/pdfmodel.dart';

class PdfPicker {
  static Future<PdfModel?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      if (kIsWeb) {
        Uint8List fileBytes = file.bytes!;
        PdfModel p = PdfModel(image: fileBytes, name: file.name);
       
          return p;
        
      }

      
    }
  }
}
