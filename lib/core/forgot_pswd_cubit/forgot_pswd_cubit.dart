import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';

part 'forgot_pswd_state.dart';
part 'forgot_pswd_cubit.freezed.dart';

@singleton
class ForgotPswdCubit extends Cubit<ForgotPswdState> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  ForgotPswdCubit(this._firebaseAuthRepository)
      : super(const ForgotPswdState.initial());

  Future<void> sendResetPassword(String email) async {
    if (state is _Loading) return;
    emit(const ForgotPswdState.loading());

    try {
      await _firebaseAuthRepository.resetPassword(email: email);
      emit(const ForgotPswdState.success());
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(const ForgotPswdState.error());
    }
  }
}
