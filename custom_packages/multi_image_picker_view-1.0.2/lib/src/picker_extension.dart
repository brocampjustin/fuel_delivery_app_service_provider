

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'image_file.dart';

Future<ImageFile> convertXFileToImageFile(dynamic xFile)async {
  
  try {
    return ImageFile(
      bytes:await File(xFile).readAsBytes(),
      UniqueKey().toString(),
      name: xFile.name,
      extension: xFile.name.contains(".") ? xFile.name.split(".").last : "",
      path: xFile.path,
    );
  } catch (e) {
    throw Exception(
        "The object pass in `convertXFileToImageFile` is not type XFile. Provided object is of type: `${xFile.runtimeType}`");
  }
}

ImageFile convertPlatformFileToImageFile(dynamic platformFile) {
  try {
    return ImageFile(UniqueKey().toString(),
        name: platformFile.name,
        extension: platformFile.extension!,
        bytes: platformFile.bytes,
        path: !kIsWeb ? platformFile.path : null);
  } catch (e) {
    throw Exception(
        "The object pass in `convertPlatformFileToImageFile` is not type PlatformFile. Provided object is of type: `${platformFile.runtimeType}`");
  }
}
