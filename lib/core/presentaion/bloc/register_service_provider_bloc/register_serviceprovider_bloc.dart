import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fuel_delivery_app_service_provider/constants/firabase_intences.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/service_center_model.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/service_provider_model.dart';
import 'package:fuel_delivery_app_service_provider/core/data/repositories/get_service_provider_data_repository.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/get_serviceprovider_data.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/upload_service_provider_data_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/errors/faliure.dart';

part 'register_serviceprovider_event.dart';
part 'register_serviceprovider_state.dart';

class RegisterServiceproviderBlocBloc extends Bloc<
    RegisterServiceproviderBlocEvent, RegisterServiceproviderBlocState> {
  UploadServiceProviderDataUsecase uploadServiceProviderDataUsecase;
  RegisterServiceproviderBlocBloc(
      {required this.uploadServiceProviderDataUsecase})
      : super(RegisterServiceproviderBlocInitial()) {
    on<InitialEvent>(
      (event, emit) async {
        emit(DataLoadingState());
        ServiceProviderDataModel? s = await GetServiceproviderDataUsecase(
                getServiceProviderDataRepository:
                    GetServiceProviderDataRepositoryImpl())
            .exicute(FireSetup.auth.currentUser!.uid);

        print(s);
        print(s!.isAccepted);
        print(s.isRegisterd);

        if (s.isRegisterd && !s.isAccepted) {
          emit(RegisteredButNotAcceptedState());
        }
        if (!s.isRegisterd && !s.isAccepted) {
          emit(NotRegisterdState());
        }
       
      },
    );

    on<RegisterServiceproviderBlocEvent>((event, emit) {
      on<RegisterButtonClickedEvent>(
        (event, emit) async {
          Either<Failure, String> responce =
              await uploadServiceProviderDataUsecase.exicute(
                  image: event.serviceProviderModel.images!,
                  lisenceDocument: event.serviceProviderModel.licenceDocument!,
                  serviceProviderModel: event.serviceProviderModel);
        },
      );
    });
  }
}
