
import 'package:dartz/dartz.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/errors/faliure.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/auth_rempsitory.dart';

import '../../data/models/auth_model.dart';

abstract class SaveUserDataUseCase {
  Future<Either<Failure, bool>> exicute(
      {required UserModel user, required String uid});
}

class SaveUserDataUsecaseImpl extends SaveUserDataUseCase {
  AuthRepository userRepository;
  SaveUserDataUsecaseImpl({required this.userRepository});

  @override
  Future<Either<Failure, bool>> exicute(
      {required UserModel user, required String uid}) {
   return userRepository.saveUserData(
        uid: uid,
        email: user.email,
        phoneNumber: user.phoneNumber,
        displayName: user.name);
  }
}
