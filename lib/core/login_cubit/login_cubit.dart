import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@singleton
class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  LoginCubit(this._firebaseAuthRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    if (state is _Loading) return;
    emit(const LoginState.loading());

    try {
      await _firebaseAuthRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(const LoginState.success());
    } on FirebaseAuthException catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(LoginState.error(errorMessage: getMessageFromErrorCode(e.code)));
    }
  }

  Future<void> signInWithGoogle() async {
    if (state is _Loading) return;
    emit(const LoginState.loading());

    try {
      await _firebaseAuthRepository.signInWithGoogle();

      emit(const LoginState.success());
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(const LoginState.error(errorMessage: 'Coś poszło nie tak!'));
    }
  }

  String getMessageFromErrorCode(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Nie znaleziono takiego użytkownika';
      case 'invalid-email':
        return 'Nie poprawny format emaila';
      case 'wrong-password':
        return 'Nie poprawny email lub hasło';
      case 'too-many-requests':
        return 'Za dużo prób, spróbuj ponownie później';
      case 'unknown':
        return 'Pola nie mogą być puste';
      default:
        return 'Błąd logowania, spróbuj ponownie';
    }
  }
}
