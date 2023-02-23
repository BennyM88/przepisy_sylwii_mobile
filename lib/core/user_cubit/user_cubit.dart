import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart';
import 'package:przepisy_sylwii_mobile/models/user_profile.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';

part 'user_state.dart';

@singleton
class UserCubit extends Cubit<UserState> {
  final FirebaseAuthRepository _firebaseAuthRepository;
  final RecipeCubit _recipeCubit;
  final FavoritesCubit _favoritesCubit;
  StreamSubscription<User?>? _userSubscription;

  UserCubit(
    this._firebaseAuthRepository,
    this._recipeCubit,
    this._favoritesCubit,
  ) : super(UserUnauthenticated()) {
    init();
  }

  void init() {
    _userSubscription ??= _initFirebaseTokenSubscription();
  }

  StreamSubscription<User?> _initFirebaseTokenSubscription() {
    return _firebaseAuthRepository
        .watchFirebaseUser()
        .listen((User? user) async {
      if (user == null) {
        emit(UserUnauthenticated());
      } else {
        fillUserWithData();
        _recipeCubit.loadRecipes([]);
        _favoritesCubit.loadFavoritesRecipes();
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
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
    }
  }

  Future<void> logout() async {
    await _firebaseAuthRepository.signOut();
    await GoogleSignIn().signOut();
  }

  bool isUserAdmin() {
    String? email = _firebaseAuthRepository.currentUser()?.email;
    if (email == 'patryk.piatkowski.skygate@gmail.com') return true;
    return false;
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
