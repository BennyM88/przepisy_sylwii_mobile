part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<Recipe> searchedRecipes,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _SearchState;
}
