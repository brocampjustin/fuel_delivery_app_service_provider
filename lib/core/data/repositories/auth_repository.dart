import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/errors/faliure.dart';
import 'package:fuel_delivery_app_service_provider/core/data/datasource/remote_datasources/singup_with_email.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/auth_model.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/auth_rempsitory.dart';

import '../../../constants/firabase_intences.dart';
import '../../domain/entities/user_entitiy.dart';
import '../datasource/remote_datasources/save_user.dart';

class FirebaseAuthRepositry implements AuthRepository {
  @override
  Future<Either<Failure, bool>> saveUserData(
      {required String uid,
      required String email,
      required String phoneNumber,
      required String displayName}) async {
    try {
      await ScveUserDataSorece.saveUser(
          name: displayName,
          email: email,
          phone: phoneNumber,
          uid: uid,
          isAccepted: false,
          isRegisterd: false);
      return const Right(true);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  
  Future<Either<Failure, bool>> updateUserData({
  required Map<String, dynamic> updateData,
  required String uid,
}) async {
  try {
    final a =
        await ScveUserDataSorece.UpdateUser(uid: uid, updateData: updateData);
    if (a) {
      return Right(true);
    } else {
      return Right(false);
    }
  } catch (e) {
    return Left(UnknownFailure(e.toString())); 
  }
}


  @override
  Future<bool> createAccountWithPhoneNumber({UserModel? userdata}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserCredential>> signUpWithEmail(
      {required UserEntity user}) async {
    try {
      UserCredential userCredential = await EmailSignUpDataSource.signUpUser(
          email: user.email,
          password: user.password,
          phone: user.phoneNumber,
          name: user.name);

      return Right(userCredential);
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return const Left(
            WeakPasswordFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return const Left(UserAlradyExistFailure(
            'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        return const Left(
            InvalidEmailFailure('The email address is not valid.'));
      } else {
        return Left(UnknownFailure('An unknown error occurred: $e'));
      }
    } catch (e) {
      return Left(UnknownFailure('An unknown error occurred: $e'));
    }
  }

  @override
  Stream<User?> get currentUser =>
      FireSetup.auth.authStateChanges().map((firebaseUser) {
        return FireSetup.auth.currentUser;
      });

  @override
  Future<bool> isEmailVaryfied() async {
    await FireSetup.auth.currentUser!.reload();
    final user = FireSetup.auth.currentUser;

    return user!.emailVerified ? true : false;
  }

  @override
  Future<void> sendEmailVarification() async {
    await FireSetup.auth.currentUser!.sendEmailVerification();
  }

  @override
  Future<User?> isLogedIn() async {
    return FireSetup.auth.currentUser;
  }

  @override
  Future<void> logOut() {
    return FireSetup.auth.signOut();
  }

  @override
  Future<Either<Failure, UserCredential>> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await EmailSignUpDataSource.Loginuser(
          email: email, passWord: password);

      return Right(userCredential);
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return const Left(
            WeakPasswordFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return const Left(UserAlradyExistFailure(
            'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        return const Left(
            InvalidEmailFailure('The email address is not valid.'));
      } else {
        return Left(UnknownFailure('An unknown error occurred: $e'));
      }
    } catch (e) {
      return Left(UnknownFailure('An unknown error occurred: $e'));

      // return Left((e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> googleSingin(
      {required String providerId, required String signInMethod}) async {
    try {
      UserCredential userCredential = await EmailSignUpDataSource.googleSignIn(
          providerId: providerId, signInMethod: signInMethod);

      return Right(userCredential);
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return const Left(
            WeakPasswordFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return const Left(UserAlradyExistFailure(
            'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        return const Left(
            InvalidEmailFailure('The email address is not valid.'));
      } else {
        return Left(UnknownFailure('An unknown error occurred: $e'));
      }
    } catch (e) {
      return Left(UnknownFailure('An unknown error occurred: $e'));
    }
  }


  
}
