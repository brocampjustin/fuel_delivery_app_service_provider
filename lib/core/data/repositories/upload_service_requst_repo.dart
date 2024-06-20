import 'dart:typed_data';

import 'package:fuel_delivery_app_service_provider/config/exten/extention_on_list.dart';
import 'package:fuel_delivery_app_service_provider/constants/firabase_intences.dart';
import 'package:fuel_delivery_app_service_provider/core/data/datasource/remote_datasources/service_center_requst.dart';
import 'package:fuel_delivery_app_service_provider/core/data/datasource/remote_datasources/upload_picture_datasorce.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/service_center_model.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/service_provider_requst.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/errors/faliure.dart';

class UploadServiceCenterRequstImpl extends UploadServiceCenterRequst {
  @override
  Future<bool> uploadServiceCenterRequest(
      {required List<Uint8List> image,
      required Uint8List lisenceDocument,
      required ServiceProviderModel serviceProviderModel}) async {
    String pdfLInk = "";

    List<String> imageLinks = [];
    try {
      for (int i = 0; i < image.length; i++) {
        imageLinks.add(await UploadFileToFireBase.upload(
            filename: DateTime.now().millisecond.toString(),
            folderName: "Service Center Images",
            file: image[i],
            fileExtention: "png"));
      }
    } catch (e) {
      print("the error is2 ${e.toString()}");
      throw ImageUploadFailure(e.toString());
    }

    try {
      pdfLInk = await UploadFileToFireBase.upload(
          filename: DateTime.now().millisecond.toString() + "document",
          folderName: "service center documents",
          file: lisenceDocument,
          fileExtention: "pdf");
    } catch (e) {
      print("the error is2 ${e.toString()}");
      throw PdfUploadFailure(e.toString());
    }

    try {
      await FireSetup.firestore
          .collection("servce center requests")
          .doc(FireSetup.auth.currentUser!.uid)
          .set({
        ...serviceProviderModel.toMap(),
        "document": pdfLInk,
        "images": imageLinks.toMap("image")
      });

      await FireSetup.users.doc(FireSetup.uid).update({"isRegisterd": true});
    } catch (e) {
      print("the error is3 ${e.toString()}");
      throw DataUpdateFailure(e.toString());
    }

    return true;
  }
}
