import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';

part 'delete_acc_state.dart';
part 'delete_acc_cubit.freezed.dart';

@singleton
class DeleteAccCubit extends Cubit<DeleteAccState> {
  final FirebaseAuthRepository _firebaseAuthRepository;
  final UserCubit _userCubit;

  DeleteAccCubit(this._firebaseAuthRepository, this._userCubit)
      : super(const DeleteAccState.initial());

  Future<void> deleteAccount() async {
    if (state is _Loading) return;
    emit(const DeleteAccState.loading());

    try {
      if (await GoogleSignIn().isSignedIn()) {
        GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
        GoogleSignInAuthentication? auth = await gUser?.authentication;
        await _firebaseAuthRepository.reauthenticateWithCredential(
          credential: GoogleAuthProvider.credential(
            accessToken: auth?.accessToken,
            idToken: auth?.idToken,
          ),
        );
      }

      await _firebaseAuthRepository.deleteAcc();
      await _userCubit.logout();
      emit(const DeleteAccState.success());
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(
        const DeleteAccState.error(
          errorMessage: 'Coś poszło nie tak, spróbuj ponownie',
        ),
      );
    }
  }
}
