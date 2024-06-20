import 'package:fuel_delivery_app_service_provider/core/data/datasource/local_datasurce/is_logding_local_datasorce.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/check_loging_local_repo.dart';

class CheckLogingLocalRepoImpl extends CheckLogingLocalRepo{
  CheckLoginLocalDataSorce checkLoginLocalDataSorce;
  CheckLogingLocalRepoImpl({required this.checkLoginLocalDataSorce});
  Future<bool> setLoginDatasorce() async {
   return await checkLoginLocalDataSorce.setLoginDatasorce();
  }
  Future<bool> getValue() async {
   return await checkLoginLocalDataSorce.getIsLogedInDatasorce();
  }
  
  
}
