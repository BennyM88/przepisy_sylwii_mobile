part of 'recipe_cubit.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.loading() = _Loading;
  const factory RecipeState.loaded({required List<Recipe> allRecipes}) =
      _Loaded;
  const factory RecipeState.error({String? errorMessage}) = _Error;
}
