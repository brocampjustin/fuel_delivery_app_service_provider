import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewDailog {
  static dialogBox(BuildContext context, Uint8List? pdfFile) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: 900,
            height: 700,
            child: SfPdfViewer.memory(pdfFile!),
          ),
        );
      },
    );
  }
}
