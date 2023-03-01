import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart';

part 'category_state.dart';

@singleton
class CategoryCubit extends Cubit<CategoryState> {
  final RecipeCubit _recipeCubit;
  List<String> pickedCategory = [];

  CategoryCubit(this._recipeCubit) : super(CategoryState());

  Future<void> setValues({
    required String category,
  }) async {
    if (pickedCategory.contains(category)) {
      pickedCategory.removeWhere(
        (element) => element == category,
      );
    } else {
      pickedCategory.add(category);
    }

    _recipeCubit.loadRecipes(pickedCategory);

    emit(
      CategoryState(category: pickedCategory),
    );
  }

  void clear() {
    pickedCategory = [];
    emit(CategoryState());
  }
}
