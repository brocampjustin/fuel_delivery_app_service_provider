

import 'package:equatable/equatable.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/auth_model.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressedEvent extends AuthEvent {
 final String email;
 final String password;
 const LoginButtonPressedEvent({required this.email, required this.password});
}

class SingUpButtonPressedEvent extends AuthEvent {
  final UserModel user;
  const SingUpButtonPressedEvent({required this.user});
}

class GoToSingUPPageEvent extends AuthEvent {}

class GoToLoginPageEvent extends AuthEvent {}

class VerifyButtonPressedEvent extends AuthEvent {}

class ResentValidationEvent extends AuthEvent {}

class LogoutPressedEvent extends AuthEvent {}

class GoogleSingInEvent extends AuthEvent {}


