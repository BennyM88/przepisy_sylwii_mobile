part of 'favorites_cubit.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default([]) List<Recipe> favoritesRecipes,
    @Default(false) bool isLoading,
  }) = _FavoritesState;
}
