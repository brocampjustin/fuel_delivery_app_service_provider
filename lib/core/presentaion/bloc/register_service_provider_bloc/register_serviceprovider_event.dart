// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_serviceprovider_bloc.dart';

sealed class RegisterServiceproviderBlocEvent extends Equatable {
  const RegisterServiceproviderBlocEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class RegisterButtonClickedEvent extends RegisterServiceproviderBlocEvent {
  ServiceProviderModel serviceProviderModel;
  RegisterButtonClickedEvent({
    required this.serviceProviderModel,
  });


  
}



class InitialEvent extends RegisterServiceproviderBlocEvent{}