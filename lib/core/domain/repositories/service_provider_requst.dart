import 'package:flutter/services.dart';

import '../../data/models/service_center_model.dart';

abstract class UploadServiceCenterRequst {
  Future<bool> uploadServiceCenterRequest(
      {required List<Uint8List> image,
      required Uint8List lisenceDocument,
      required ServiceProviderModel serviceProviderModel});
}
