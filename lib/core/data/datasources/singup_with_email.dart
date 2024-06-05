

import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants/firabase_intences.dart';
import '../../presentaion/errors/faliure.dart';

class EmailSignUpDataSource {
  static Future<UserCredential> signUpUser({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {

    try {
      UserCredential userCredential = await FireSetup.auth
          .createUserWithEmailAndPassword(email: email, password: password);
      FireSetup.auth.currentUser!.updateDisplayName(name);
      FireSetup.auth.currentUser!.verifyBeforeUpdateEmail(email);

      return userCredential;
    }  catch (e) {
      throw ServerFailure(e.toString());
    }

  }


  static Future<UserCredential>Loginuser({required String email, required String passWord})async{

       try {
      UserCredential userCredential = await FireSetup.auth
          .signInWithEmailAndPassword(email: email, password: passWord);


      return userCredential;
    }  catch (e) {
      throw ServerFailure(e.toString());
    }
  }
  static Future<UserCredential>googleSignIn({required String providerId, required String signInMethod})async{

       try {
      UserCredential userCredential = await FireSetup.auth
          .signInWithCredential(AuthCredential(providerId: providerId, signInMethod: signInMethod));


      return userCredential;
    }  catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
