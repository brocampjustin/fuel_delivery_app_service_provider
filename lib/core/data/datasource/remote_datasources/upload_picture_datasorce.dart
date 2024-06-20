import 'dart:typed_data';
import 'package:fuel_delivery_app_service_provider/constants/firabase_intences.dart';

class UploadFileToFireBase {
  static Future<String> upload(
      {
        required String filename,
        required String folderName,
      required Uint8List file,
      required String fileExtention
      }) async{
    try {
      String fileName =
          "${folderName}/${FireSetup.auth.currentUser!.uid}/${filename}.$fileExtention";
    await  FireSetup.storage.ref(fileName).putData(file);

      return FireSetup.storage.ref(fileName).getDownloadURL();
    } catch (e) {
      throw Exception(e);
    }
  }
}
