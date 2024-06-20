import 'package:fuel_delivery_app_service_provider/core/presentaion/functions/convert_to_uint_8_list.dart';
import 'package:image_picker/image_picker.dart';

class PickImage {
 static pick()async{
    List<XFile>? images = await ImagePicker().pickMultiImage();
    return ConvertToUint8List.xFileListToUint8List(images);
 }
  
}