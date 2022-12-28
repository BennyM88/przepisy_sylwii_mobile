import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.g.dart';
part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String dishName,
    @Default('') String url,
    @Default('') String category,
    @Default('') String desc,
    @Default(0) int amount,
    @Default(0) int time,
    @Default([]) List<String> ingredients,
    @Default([]) List<String> preparation,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
