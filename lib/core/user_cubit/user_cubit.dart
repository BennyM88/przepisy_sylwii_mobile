import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/models/user_profile.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart';

part 'user_state.dart';

@singleton
class UserCubit extends Cubit<UserState> {
  final FirebaseAuthRepository _firebaseAuthRepository;
  StreamSubscription<User?>? _userSubscription;

  UserCubit(this._firebaseAuthRepository) : super(UserUnauthenticated());

  void init() {
    _userSubscription = _initFirebaseTokenSubscription();
  }

  StreamSubscription<User?> _initFirebaseTokenSubscription() {
    return _firebaseAuthRepository
        .watchFirebaseUser()
        .listen((User? user) async {
      if (user == null) {
        emit(UserUnauthenticated());
      } else {
        fillUserWithData();
        emit(UserAuthenticated(user: user));
      }
    });
  }

  Future<void> fillUserWithData() async {
    try {
      User? currentUser = _firebaseAuthRepository.currentUser();
      if (currentUser != null) {
        UserProfile userProfile =
            await _firebaseAuthRepository.getUserDetails();
        emit(UserAuthenticated(userProfile: userProfile));
      } else {
        emit(UserUnauthenticated());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> logout() async {
    await _firebaseAuthRepository.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
