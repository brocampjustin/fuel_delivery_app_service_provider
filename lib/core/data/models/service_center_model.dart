// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields,
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/entities/service_provider_entity.dart';

class ServiceProviderModel extends ServiceProviderEntity {
  
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
  
  
  ServiceProviderModel({
     this.licenceDocument,
     this.images,
    required this.serviceCentername,
    required this.adminName,
    required this.address,
    required this.country,
    required this.state,
    required this.phoneNuber,
    required this.latitude,
    required this.longitude,
  }) : super(
    images: images,
    licenceDocument: licenceDocument,
    
          serviceCentername: serviceCentername,
          adminName: adminName,
          address: address,
          country: country,
          state: state,
          phoneNuber: phoneNuber,
          latitude: latitude,
          longitude: longitude,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceCentername': serviceCentername,
      'adminName': adminName,
      'address': address,
      'country': country,
      'state': state,
      'phoneNuber': phoneNuber,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory ServiceProviderModel.fromMap(Map<String, dynamic> map) {
    return ServiceProviderModel(
        
      serviceCentername: map['serviceCentername'] as String,
      adminName: map['adminName'] as String,
      address: map['address'] as String,
      country: map['country'] as String,
      state: map['state'] as String,
      phoneNuber: map['phoneNuber'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProviderModel.fromJson(String source) => ServiceProviderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceProciderModel(serviceCentername: $serviceCentername, adminName: $adminName, address: $address, country: $country, state: $state, phoneNuber: $phoneNuber, latitude: $latitude, longitude: $longitude)';
  }

  


}
