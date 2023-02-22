part of 'add_ingredients_cubit.dart';

@freezed
class AddIngredientsState with _$AddIngredientsState {
  const factory AddIngredientsState({
    @Default([]) List<String> ingredients,
  }) = _AddIngredientsState;
}
