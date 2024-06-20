import 'package:fuel_delivery_app_service_provider/core/data/models/service_provider_model.dart';

abstract class GetServiceProviderDataRepository {
  Future<ServiceProviderDataModel?> getData(String uid);
}
