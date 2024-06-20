import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/auth_model.dart';

import '../../../../constants/firabase_intences.dart';

class ScveUserDataSorece {
  static Future<bool> saveUser(
      {required String name,
      required String email,
      required String phone,
      required String uid,
      required bool isRegisterd,
      required bool isAccepted}) async {
    try {
      await FireSetup.users.doc(uid).set({
        "email": email,
        "name": name,
        "phoneNuber": phone,
        "isRegisterd": false,
        "isAccepted": false
      });
      return true;
    } catch (e) {
      throw e;
    }
  }

  static Future<bool> UpdateUser(
      {required String uid, required Map<String, dynamic> updateData}) async {
    try {
      await FireSetup.users.doc(uid).update(updateData);
      return true;
    } catch (e) {
      throw e;
    }
  }

  static Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          await FireSetup.users.doc(uid).get();
      Map<String, dynamic>? a = docSnapshot.data();
      print("this is the value of doc ${a}");

      return a;
    } catch (e) {
      // Consider logging the error or handling it accordingly
      print("Error fetching user data: $e");
      return null; // Return null in case of an error
    }
  }
}
