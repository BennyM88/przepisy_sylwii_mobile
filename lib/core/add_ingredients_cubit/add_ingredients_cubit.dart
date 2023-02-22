import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_ingredients_state.dart';
part 'add_ingredients_cubit.freezed.dart';

@singleton
class AddIngredientsCubit extends Cubit<AddIngredientsState> {
  AddIngredientsCubit() : super(const AddIngredientsState());

  void addIngredient(String ingredient) {
    if (ingredient == '') return;

    List<String> finalIngredients = [];
    finalIngredients.addAll(state.ingredients);
    finalIngredients.add(ingredient);

    emit(state.copyWith(ingredients: finalIngredients));
  }

  void removeIngredient(int index) {
    List<String> finalIngredients = [];
    finalIngredients.addAll(state.ingredients);
    finalIngredients.removeAt(index);

    emit(state.copyWith(ingredients: finalIngredients));
  }
}
