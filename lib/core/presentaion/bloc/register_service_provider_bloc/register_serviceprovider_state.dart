part of 'register_serviceprovider_bloc.dart';

sealed class RegisterServiceproviderBlocState extends Equatable {
  const RegisterServiceproviderBlocState();
  
  @override
  List<Object> get props => [];
}

final class RegisterServiceproviderBlocInitial extends RegisterServiceproviderBlocState {}
final class ShoudRegisterState extends RegisterServiceproviderBlocState {}
final class SucessfullyRegisterdState extends RegisterServiceproviderBlocState {}
final class RegisterRequestFaildState extends RegisterServiceproviderBlocState {}
final class RegisterRequstUploadingState extends RegisterServiceproviderBlocState {}
final class DataLoadingState extends RegisterServiceproviderBlocState {}


final class RegisteredButNotAcceptedState extends RegisterServiceproviderBlocState {}
final class AcceptedAsServiceProviderState extends RegisterServiceproviderBlocState {}
final class NotRegisterdState extends RegisterServiceproviderBlocState {}