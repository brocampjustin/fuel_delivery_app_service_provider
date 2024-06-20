import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fuel_delivery_app_service_provider/constants/firabase_intences.dart';

class ServiceCenterRequstDataSorce {
  Future<bool> makeRequest(
      {required Map<String, dynamic> serviceCenterModel}) async {
    try {
      DocumentReference<Map<String, dynamic>> s = await FireSetup.firestore
          .collection("servce center requests")
          .add(serviceCenterModel);
      await FireSetup.users.doc(FireSetup.uid);
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
