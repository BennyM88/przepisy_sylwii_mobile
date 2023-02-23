part of 'add_new_recipe_cubit.dart';

@freezed
class AddNewRecipeState with _$AddNewRecipeState {
  const factory AddNewRecipeState.initial() = _Initial;
  const factory AddNewRecipeState.loading() = _Loading;
  const factory AddNewRecipeState.error({String? errorMessage}) = _Error;
  const factory AddNewRecipeState.success() = _Success;
}
