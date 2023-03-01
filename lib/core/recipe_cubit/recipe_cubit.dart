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

  RecipeCubit(this._firebaseRepository) : super(const RecipeState());

  Future<void> loadRecipes(List<String> categoryName) async {
    emit(const RecipeState(isLoading: true));

    try {
      List<Recipe> allRecipes = await _firebaseRepository.getAllRecipes();

      if (categoryName.isEmpty) {
        emit(RecipeState(allRecipes: allRecipes, isLoading: false));
      } else {
        List<Recipe> recipesWithCategory = [];

        for (int i = 0; i < allRecipes.length; i++) {
          if (categoryName.contains(allRecipes[i].category)) {
            recipesWithCategory.add(allRecipes[i]);
          }
        }

        emit(state.copyWith(allRecipes: recipesWithCategory, isLoading: false));
      }
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(RecipeState(errorMessage: e.toString(), isLoading: false));
    }
  }
}
