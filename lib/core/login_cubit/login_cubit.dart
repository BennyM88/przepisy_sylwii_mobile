import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart';

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
    } on FirebaseAuthException catch (e) {
      emit(LoginState.error(errorMessage: e.message));
    }
  }
}
