import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AmountCubit extends Cubit<int> {
  AmountCubit() : super(1);

  void increment() {
    if (state > 7) return;

    emit(state + 1);
  }

  void decrement() {
    if (state < 2) return;

    emit(state - 1);
  }

  void clear() {
    emit(1);
  }
}
