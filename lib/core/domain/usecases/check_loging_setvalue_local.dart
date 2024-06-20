import 'package:fuel_delivery_app_service_provider/core/domain/repositories/check_loging_local_repo.dart';

class CheckLoginSetValueLocalUsecase {
  CheckLogingLocalRepo checkLogingLocalRepo;
  CheckLoginSetValueLocalUsecase({required this.checkLogingLocalRepo});
  Future<bool> exicute() {
    return checkLogingLocalRepo.setLoginDatasorce();
  }
}
