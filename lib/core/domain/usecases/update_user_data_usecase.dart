import 'package:fuel_delivery_app_service_provider/core/domain/repositories/auth_rempsitory.dart';

class UpdateUserDataUsecase {
  AuthRepository authRepository;
  UpdateUserDataUsecase({required this.authRepository});
  exicute(
      {String? name,
      String? email,
      String? phone,
      required String uid,
      bool? isRegisterd,
      bool? isAccepted}) async {
    Map<String, dynamic> updateData = {
      if (email != null) "email": email,
      if (name != null) "name": name,
      if (phone != null) "phone": phone,
      if (isAccepted != null) "isAccepted": isAccepted,
      if (isRegisterd != null) "isRegisterd": isRegisterd,
    };

    authRepository.updateUserData(updateData: updateData, uid: uid);
  }
}
