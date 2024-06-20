import 'package:flutter/material.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/models/map_mode.dart';
import 'package:map_location_picker/map_location_picker.dart';

class LocatinPickerDailogBox {
  static void locationPickerDailog(
      BuildContext context,
      double latitude,
      double longitude,
      MapModel mapModel,
      TextEditingController plceController,
      GeocodingResult? location) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Container(
                width: 900,
                height: 500,
                child: MapLocationPicker(
                  apiKey: "AIzaSyBllEcLNojXIoQa7owWvSfJAR2Cpubk-8U",
                  onNext: (result) {
                    location = result;
                    latitude = result?.geometry.location.lat ?? 0.00000;
                    longitude = result?.geometry.location.lng ?? 0.000;
                    plceController.text = result!.formattedAddress ?? "";
                    mapModel.logitude = longitude;
                    mapModel.latitude = latitude;
                    mapModel.address = plceController.text;

                    print("this is lat and log ${[latitude, longitude]}");

                    Navigator.pop(context);
                  },
                )));
      },
    );
  }
}
