import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_preparation_state.dart';
part 'add_preparation_cubit.freezed.dart';

@singleton
class AddPreparationCubit extends Cubit<AddPreparationState> {
  AddPreparationCubit() : super(const AddPreparationState());

  void addPreparationStep(String step) {
    if (step == '') return;

    List<String> finalPreparation = [];
    finalPreparation.addAll(state.preparation);
    finalPreparation.add(step);

    emit(state.copyWith(preparation: finalPreparation));
  }

  void removePreparationStep(int index) {
    List<String> finalPreparation = [];
    finalPreparation.addAll(state.preparation);
    finalPreparation.removeAt(index);

    emit(state.copyWith(preparation: finalPreparation));
  }

  void clear() {
    emit(const AddPreparationState());
  }
}
