import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart';

part 'recipe_cubit.freezed.dart';
part 'recipe_state.dart';

@singleton
class RecipeCubit extends Cubit<RecipeState> {
  final FirebaseRepository _firebaseRepository;

  RecipeCubit(this._firebaseRepository) : super(const RecipeState.loading());

  Future<void> loadRecipes() async {
    try {
      List<Recipe> allRecipes = await _firebaseRepository.getAllRecipes();

      emit(
        RecipeState.loaded(allRecipes: allRecipes),
      );
    } on Exception catch (e) {
      emit(
        RecipeState.error(errorMessage: e.toString()),
      );
    }
  }

  // void loadCategoryRecipes(List<String> categoryName) {
  //   _Loaded recipeState = state as _Loaded;
  //   List<Recipe> recipesWithCategory = [];

  //   for (int i = 0; i < recipeState.allRecipes.length; i++) {
  //     if (categoryName.contains(recipeState.allRecipes[i].category)) {
  //       recipesWithCategory.add(recipeState.allRecipes[i]);
  //     }
  //   }
  //   print('cos ' + recipesWithCategory.toString());
  //   final newState = recipeState.copyWith(allRecipes: recipesWithCategory);
  //   emit(newState);
  // }
}
