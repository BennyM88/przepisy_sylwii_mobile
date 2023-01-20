import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart';

part 'recipe_cubit.freezed.dart';
part 'recipe_state.dart';

@singleton
class RecipeCubit extends Cubit<RecipeState> {
  final FirebaseRepository _firebaseRepository;

  RecipeCubit(this._firebaseRepository) : super(const RecipeState.initial());

  //TODO refactor this method with better states
  Future<void> loadRecipes(List<String> categoryName) async {
    try {
      List<Recipe> allRecipes = await _firebaseRepository.getAllRecipes();

      if (categoryName.isEmpty) {
        emit(
          RecipeState.loaded(allRecipes: allRecipes),
        );
      } else {
        _Loaded recipeState = state as _Loaded;
        List<Recipe> recipesWithCategory = [];

        emit(const RecipeState.loading());

        for (int i = 0; i < allRecipes.length; i++) {
          if (categoryName.contains(allRecipes[i].category)) {
            recipesWithCategory.add(allRecipes[i]);
          }
        }

        _$_Loaded newRecipeState =
            recipeState.copyWith(allRecipes: recipesWithCategory);
        emit(newRecipeState);
      }
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(
        RecipeState.error(errorMessage: e.toString()),
      );
    }
  }
}
