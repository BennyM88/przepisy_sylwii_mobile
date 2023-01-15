import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/models/user_profile.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart';

part 'user_state.dart';

@singleton
class UserCubit extends Cubit<UserState> {
  final FirebaseRepository _firebaseRepository;
  StreamSubscription<User?>? _userSubscription;

  UserCubit(this._firebaseRepository) : super(UserUnauthenticated());

  void init() {
    _userSubscription = _initFirebaseTokenSubscription();
  }

  StreamSubscription<User?> _initFirebaseTokenSubscription() {
    return _firebaseRepository.watchFirebaseUser().listen((User? user) async {
      if (user == null) {
        emit(UserUnauthenticated());
      } else {
        fillUserWithData();
        emit(UserAuthenticated(user));
      }
    });
  }

  Future<void> fillUserWithData() async {
    try {
      User? currentUser = _firebaseRepository.currentUser();
      if (currentUser != null) {
        UserProfile userProfile = await _firebaseRepository.getUserDetails();
        emit(UserFilledWithData(userProfile));
      } else {
        emit(UserUnauthenticated());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void changeUserState(UserState state) {
    emit(state);
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
