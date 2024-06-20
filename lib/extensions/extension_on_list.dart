import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

extension ListToMapExtension on List<String> {
  Map<String, String> toMap(String prefix) {
    final map = <String, String>{};
    for (var i = 0; i < this.length; i++) {
      map['$prefix${i + 1}'] = this[i];
    }
    return map;
  }
}


