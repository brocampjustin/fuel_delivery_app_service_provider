// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fuel_delivery_app_service_provider/core/data/models/service_provider_model.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/get_service_provider_data_repo.dart';

class GetServiceproviderDataUsecase {
  GetServiceProviderDataRepository getServiceProviderDataRepository;
  GetServiceproviderDataUsecase({
    required this.getServiceProviderDataRepository,
  });

  Future<ServiceProviderDataModel?> exicute(String uid) async {
    return await getServiceProviderDataRepository.getData(uid);
  }
}
