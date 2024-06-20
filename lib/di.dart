import 'package:fuel_delivery_app_service_provider/core/data/datasource/local_datasurce/is_logding_local_datasorce.dart';
import 'package:fuel_delivery_app_service_provider/core/data/repositories/auth_repository.dart';
import 'package:fuel_delivery_app_service_provider/core/data/repositories/check_loging_local_repo.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/auth_rempsitory.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/check_loging_local_repo.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/check_loging_setvalue_local.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/chick_login_local_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/saveuser_data_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/singn_usecase.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUP() {
  locator.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecaseImpl(userRepository: locator()));
  locator.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepositry());
  locator.registerLazySingleton<SaveUserDataUseCase>(
      () => SaveUserDataUsecaseImpl(userRepository: locator()));

  // Register CheckLoginLocalDataSorce only once
  locator.registerLazySingleton<CheckLoginLocalDataSorce>(
      () => CheckLoginLocalDataSorce());

  // Ensure CheckLoginLocalRepoImpl is registered correctly
  locator.registerLazySingleton<CheckLogingLocalRepo>(
    () => CheckLogingLocalRepoImpl(checkLoginLocalDataSorce: locator()),
  );

  locator.registerLazySingleton<CheckLoginUsecase>(
    () => CheckLoginUsecase(
        checkLogingLocalRepo:
            CheckLogingLocalRepoImpl(checkLoginLocalDataSorce: locator())),
  );

  locator.registerLazySingleton<CheckLoginSetValueLocalUsecase>(
    () => CheckLoginSetValueLocalUsecase(checkLogingLocalRepo: locator()),
  );
}
