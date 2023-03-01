import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart';
import 'package:przepisy_sylwii_mobile/view/utils/capitalize_extenstion.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

@singleton
class SearchCubit extends Cubit<SearchState> {
  final FirebaseRepository _firebaseRepository;

  SearchCubit(this._firebaseRepository) : super(const SearchState());

  Future<void> init() async {
    emit(const SearchState(isLoading: true));

    try {
      List<Recipe> allRecipes = await _firebaseRepository.getAllRecipes();

      emit(SearchState(searchedRecipes: allRecipes, isLoading: false));
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(SearchState(errorMessage: e.toString(), isLoading: false));
    }
  }

  Future<void> searchRecipe(String keyword) async {
    emit(const SearchState(isLoading: true));

    if (keyword.isEmpty) {
      init();
      return;
    }

    try {
      List<Recipe> searchedRecipes =
          await _firebaseRepository.searchRecipe(keyword.capitalize());

      emit(state.copyWith(searchedRecipes: searchedRecipes, isLoading: false));
    } on Exception catch (e, st) {
      FirebaseCrashlyticsService.recordError(e, st);
      emit(SearchState(errorMessage: e.toString(), isLoading: false));
    }
  }
}
