
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/auth_rempsitory.dart';

import '../../presentaion/errors/faliure.dart';
import '../../data/models/auth_model.dart';

abstract class SignUpUsecase {
  Future<Either<Failure, UserCredential>> execute(UserModel userdata);
  Future<void> signOut();
  Future<bool> isEmailVaryfied();
  Future<void> sendVerificationEmail();
  Future<User?> isLogedIn();
  Future<Either<Failure, UserCredential>> logininWithEmail(
      {required String email, required String password});

  Future<Either<Failure, UserCredential>> googleSingIn(
      {required String providerId, required String signInMethod});
}

class SignUpUsecaseImpl extends SignUpUsecase {
  final AuthRepository userRepository;

  SignUpUsecaseImpl({required this.userRepository});
  @override
  Future<Either<Failure, UserCredential>> execute(UserModel userdata) async {
    Either<Failure, UserCredential> userCreated =
        await userRepository.signUpWithEmail(user: userdata);

    return userCreated;
  }

  @override
  Future<bool> isEmailVaryfied() async {
    return await userRepository.isEmailVaryfied();
  }

  @override
  Future<void> sendVerificationEmail() async {
    return await userRepository.sendEmailVarification();
  }

  @override
  Future<void> signOut() {
    return userRepository.logOut();
  }

  @override
  Future<User?> isLogedIn() {
    return userRepository.isLogedIn();
  }

  Future<Either<Failure, UserCredential>> logininWithEmail(
      {required String email, required String password}) {
    return userRepository.logInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<Either<Failure, UserCredential>> googleSingIn(
      {required String providerId, required String signInMethod}) {
    return userRepository.googleSingin(
        providerId: providerId, signInMethod: signInMethod);
  }
}
