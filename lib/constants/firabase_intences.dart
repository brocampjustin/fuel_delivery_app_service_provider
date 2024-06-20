import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireSetup {
  static CollectionReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection('serviceproviders');

  static String? uid = auth.currentUser?.uid;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseStorage storage = FirebaseStorage.instance;
}
