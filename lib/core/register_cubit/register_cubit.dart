import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@singleton
class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  RegisterCubit(this._firebaseAuthRepository)
      : super(const RegisterState.initial());

  Future<void> register(String name, String email, String password) async {
    if (state is _Loading) return;
    emit(const RegisterState.loading());

    try {
      await _firebaseAuthRepository.createUserWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );

      emit(const RegisterState.success());
    } on FirebaseAuthException catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(RegisterState.error(errorMessage: getMessageFromErrorCode(e.code)));
    }
  }

  void emitError(String? errorMessage) {
    emit(RegisterState.error(errorMessage: errorMessage));
  }

  String getMessageFromErrorCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Email jest już w użyciu';
      case 'invalid-email':
        return 'Nie poprawny format emaila';
      case 'weak-password':
        return 'Hasło jest za słabe';
      default:
        return 'Błąd rejestracji, spróbuj ponownie';
    }
  }
}
