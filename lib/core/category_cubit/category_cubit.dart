import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'category_state.dart';

@singleton
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState());

  void setValues({
    required List<String> category,
  }) {
    emit(
      CategoryState(category: category),
    );
  }
}
