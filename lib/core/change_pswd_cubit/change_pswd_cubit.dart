import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';

part 'change_pswd_state.dart';
part 'change_pswd_cubit.freezed.dart';

@singleton
class ChangePswdCubit extends Cubit<ChangePswdState> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  ChangePswdCubit(this._firebaseAuthRepository)
      : super(const ChangePswdState.initial());

  Future<void> changePassword(
    String email,
    String currentPassword,
    String newPassword,
  ) async {
    if (state is _Loading) return;
    emit(const ChangePswdState.loading());

    if (currentPassword.isEmpty || newPassword.isEmpty) {
      emit(
        const ChangePswdState.error(errorMessage: 'Pola nie mogą być puste'),
      );
      return;
    }

    try {
      await _firebaseAuthRepository.reauthenticateWithEmailAndPassword(
        email: email,
        password: currentPassword,
      );
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(const ChangePswdState.error(errorMessage: 'Złe hasło'));
      return;
    }

    try {
      await _firebaseAuthRepository.updatePassword(newPassword: newPassword);
      emit(const ChangePswdState.success());
    } on FirebaseAuthException catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(
        const ChangePswdState.error(errorMessage: 'Nowe hasło jest za słabe'),
      );
    }
  }
}
