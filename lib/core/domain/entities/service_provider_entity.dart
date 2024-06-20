// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class ServiceProviderEntity {
  List<Uint8List>? images;
  Uint8List? licenceDocument;
  String serviceCentername;
  String adminName;
  String address;
  String country;
  String state;
  String phoneNuber;
  double latitude;
  double longitude;
  ServiceProviderEntity({
    required this.images,
    required this.licenceDocument,
    required this.serviceCentername,
    required this.adminName,
    required this.address,
    required this.country,
    required this.state,
    required this.phoneNuber,
    required this.latitude,
    required this.longitude,
  });
}
