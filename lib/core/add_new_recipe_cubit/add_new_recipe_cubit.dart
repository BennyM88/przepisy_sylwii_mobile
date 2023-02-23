import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart';

part 'add_new_recipe_state.dart';
part 'add_new_recipe_cubit.freezed.dart';

@singleton
class AddNewRecipeCubit extends Cubit<AddNewRecipeState> {
  final FirebaseRepository _firebaseRepository;

  AddNewRecipeCubit(this._firebaseRepository)
      : super(const AddNewRecipeState.initial());

  Future<void> addNewRecipe(
    String url,
    String name,
    String desc,
    String time,
    int amount,
    String category,
    List<String> ingredients,
    List<String> preparation,
  ) async {
    if (state is _Loading) return;
    emit(const AddNewRecipeState.loading());

    if (url.isEmpty ||
        name.isEmpty ||
        desc.isEmpty ||
        time.isEmpty ||
        ingredients.isEmpty ||
        preparation.isEmpty) {
      emit(
        const AddNewRecipeState.error(errorMessage: 'Pola nie mogą być puste'),
      );
      return;
    }

    try {
      int newTime = int.parse(time);
      Recipe newRecipe = Recipe(
        dishName: name,
        url: url,
        category: category,
        desc: desc,
        amount: amount,
        time: newTime,
        ingredients: ingredients,
        preparation: preparation,
      );

      await _firebaseRepository.addNewRecipe(newRecipe);
      emit(const AddNewRecipeState.success());
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(const AddNewRecipeState.error(errorMessage: 'Coś poszło nie tak!'));
    }
  }
}
