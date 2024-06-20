import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_service_provider_state.dart';

class RegisterServiceProviderCubit extends Cubit<RegisterServiceProviderState> {
  RegisterServiceProviderCubit() : super(RegisterServiceProviderInitial());
}
