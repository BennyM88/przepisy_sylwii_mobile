import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

@singleton
class FavoritesCubit extends Cubit<FavoritesState> {
  final FirebaseRepository _firebaseRepository;
  final FirebaseAuthRepository _firebaseAuthRepository;

  FavoritesCubit(this._firebaseRepository, this._firebaseAuthRepository)
      : super(const FavoritesState());

  Future<void> loadFavoritesRecipes() async {
    try {
      emit(const FavoritesState(isLoading: true));

      List<Recipe> allFavoritesRecipes = await _firebaseRepository
          .getAllFavoritesRecipes(_firebaseAuthRepository.currentUser()!.email);

      emit(
        FavoritesState(
          favoritesRecipes: allFavoritesRecipes,
          isLoading: false,
        ),
      );
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(const FavoritesState(isLoading: false));
    }
  }

  Future<void> addOrRemoveFavorites(Recipe recipe) async {
    if (state.isLoading) return;
    emit(
      FavoritesState(
        favoritesRecipes: state.favoritesRecipes,
        isLoading: true,
      ),
    );

    List<Recipe> finalFavList = [];
    finalFavList.addAll(state.favoritesRecipes);

    try {
      if (state.favoritesRecipes.contains(recipe)) {
        await _firebaseRepository.removeFromFavorites(
          recipe,
          _firebaseAuthRepository.currentUser()!.email,
        );
        finalFavList.removeWhere((element) => element == recipe);

        emit(state.copyWith(favoritesRecipes: finalFavList, isLoading: false));
      } else {
        await _firebaseRepository.addToFavorites(
          recipe,
          _firebaseAuthRepository.currentUser()!.email,
        );
        finalFavList.add(recipe);

        emit(state.copyWith(favoritesRecipes: finalFavList, isLoading: false));
      }
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
    }
  }
}
