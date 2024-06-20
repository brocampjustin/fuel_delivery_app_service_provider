import 'package:fuel_delivery_app_service_provider/core/data/repositories/check_loging_local_repo.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/check_loging_local_repo.dart';

class CheckLoginUsecase {
  CheckLogingLocalRepoImpl checkLogingLocalRepo;
  CheckLoginUsecase({required this.checkLogingLocalRepo});
  Future<bool> exicute() {
    return checkLogingLocalRepo.getValue();
  }
}
