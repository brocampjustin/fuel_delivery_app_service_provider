import 'package:fuel_delivery_app_service_provider/core/data/datasource/remote_datasources/save_user.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/service_provider_model.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/get_service_provider_data_repo.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/errors/faliure.dart';

class GetServiceProviderDataRepositoryImpl extends GetServiceProviderDataRepository{
  Future<ServiceProviderDataModel?> getData(String uid) async {
    try {
      Map<String, dynamic>? userData =
          await ScveUserDataSorece.getUserData(uid);
      if (userData != null) {
        return ServiceProviderDataModel.fromMap(userData);
      }
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
