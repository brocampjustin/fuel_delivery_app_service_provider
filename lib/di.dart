
import 'package:fuel_delivery_app_service_provider/core/data/repositories/auth_repository.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/auth_rempsitory.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/saveuser_data_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/singn_usecase.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUP() {
  locator.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecaseImpl(userRepository: locator()));
  locator.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepositry());
  locator.registerLazySingleton<SaveUserDataUseCase>(() => SaveUserDataUsecaseImpl(userRepository:locator() ));
}
