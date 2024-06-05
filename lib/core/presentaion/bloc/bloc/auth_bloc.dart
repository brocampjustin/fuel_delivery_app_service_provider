import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fuel_delivery_app_service_provider/constants/firabase_intences.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/errors/faliure.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/saveuser_data_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/singn_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/bloc/auth_event.dart';

import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SignUpUsecase signUpUsecase;
  SaveUserDataUseCase saveUserDataUseCase;

  AuthBloc({required this.saveUserDataUseCase, required this.signUpUsecase})
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SingUpButtonPressedEvent>((event, emit) => singUP(
        signUpUsecase: signUpUsecase,
        emit: emit,
        event: event,
        saveUserDataUseCase: saveUserDataUseCase));
    on<VerifyButtonPressedEvent>((event, emit) async {
      bool a = await signUpUsecase.isEmailVaryfied();
      if (a) {
        emit(EmailVaryfiedState());
      } else {
        emit(EmailVarificationFailedState());
      }
    });

    on<LogoutPressedEvent>((event, emit) async {
      await signUpUsecase.signOut();
      emit(LogOutState());
    });
    on<LoginButtonPressedEvent>((event, emit) async {
      Either<Failure, UserCredential> longinCredential = await signUpUsecase
          .logininWithEmail(email: event.email, password: event.password);

      longinCredential.fold((l) => emit(LoginErrorState(err: l.toString())),
          (r) {
        if (FireSetup.auth.currentUser!.emailVerified) {
          emit(LoginState());
        } else {
          
          signUpUsecase.sendVerificationEmail();
          emit(LoginNotVerifydeState());
        }
      });
    });
    on<GoogleSingInEvent>((event, emit) async {
      try {
        final a = await signInWithGoogle();
        emit(LoginState());
      } catch (e) {
        emit(LoginErrorState(err: e.toString()));
      }
    });
  }
}

singUP(
    {required SignUpUsecase signUpUsecase,
    required Emitter<AuthState> emit,
    required SingUpButtonPressedEvent event,
    required SaveUserDataUseCase saveUserDataUseCase}) async {
  Either<Failure, UserCredential> singUpCredential =
      await signUpUsecase.execute(event.user);
  singUpCredential.fold((l) {
    return emit(SingnUpFaildState(err: l.toString()));
  }, (r) async {
    emit(SignUpSucessState());
    await signUpUsecase.sendVerificationEmail();
    emit(VarificationEmailSendState());

    Timer.periodic(Duration(seconds: 3), (timer) async {
      bool a = await signUpUsecase.isEmailVaryfied();
      if (a) {
        emit(EmailVaryfiedState());
        timer.cancel();
      }
    });

    await saveUserDataUseCase.exicute(user: event.user, uid: r.user!.uid);
  });
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}
