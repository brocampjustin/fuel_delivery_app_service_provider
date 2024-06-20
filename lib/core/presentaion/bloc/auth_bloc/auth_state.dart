part of 'auth_bloc.dart';

sealed class AuthState {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class SingnUpFaildState extends AuthState {
  String err;
  SingnUpFaildState({required this.err});
}

final class SingnUPLodinState extends AuthState {}

final class SignUpSucessState extends AuthState {}

final class VarificationEmailSendState extends AuthState {}

final class EmailVaryfiedState extends AuthState {}

final class EmailVarificationFailedState extends AuthState {}

final class LogOutState extends AuthState {}

final class LoginState extends AuthState {}

final class LoginNotVerifydeState extends AuthState {}

final class LoginErrorState extends AuthState {
  String err;
  LoginErrorState({required this.err});
}

final class GoogleSigninState extends AuthState {
  String providerId;
  String signInMethod;
  GoogleSigninState({required this.providerId, required this.signInMethod});
}

final class GoogleSingInSucessStat extends AuthState {}

final class GoogleSingInFaildState extends AuthState {
  String err;
  GoogleSingInFaildState({required this.err});
}
