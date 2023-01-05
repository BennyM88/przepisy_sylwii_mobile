import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@singleton
class LoginCubit extends Cubit<LoginState> {
  final FirebaseRepository _firebaseRepository;

  LoginCubit(this._firebaseRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    if (state is _Loading) return;
    emit(const LoginState.loading());

    try {
      await _firebaseRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(const LoginState.success());
    } on Exception catch (e) {
      emit(LoginState.error(errorMessage: e.toString()));
    }
  }
}
