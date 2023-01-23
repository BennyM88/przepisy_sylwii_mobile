part of 'recipe_cubit.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState({
    @Default([]) List<Recipe> allRecipes,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _RecipeState;
}
