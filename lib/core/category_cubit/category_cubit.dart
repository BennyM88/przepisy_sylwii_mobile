import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart';

part 'category_state.dart';

@singleton
class CategoryCubit extends Cubit<CategoryState> {
  final RecipeCubit _recipeCubit;

  CategoryCubit(this._recipeCubit) : super(CategoryState());

  Future<void> setValues({
    required List<String> category,
  }) async {
    _recipeCubit.loadRecipes(category);
    emit(
      CategoryState(category: category),
    );
  }
}
