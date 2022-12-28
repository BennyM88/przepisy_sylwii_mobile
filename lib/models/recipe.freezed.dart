// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String get dishName => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  List<String> get preparation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {String dishName,
      String url,
      String category,
      int amount,
      int time,
      List<String> ingredients,
      List<String> preparation});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dishName = null,
    Object? url = null,
    Object? category = null,
    Object? amount = null,
    Object? time = null,
    Object? ingredients = null,
    Object? preparation = null,
  }) {
    return _then(_value.copyWith(
      dishName: null == dishName
          ? _value.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preparation: null == preparation
          ? _value.preparation
          : preparation // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$_RecipeCopyWith(_$_Recipe value, $Res Function(_$_Recipe) then) =
      __$$_RecipeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dishName,
      String url,
      String category,
      int amount,
      int time,
      List<String> ingredients,
      List<String> preparation});
}

/// @nodoc
class __$$_RecipeCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$_Recipe>
    implements _$$_RecipeCopyWith<$Res> {
  __$$_RecipeCopyWithImpl(_$_Recipe _value, $Res Function(_$_Recipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dishName = null,
    Object? url = null,
    Object? category = null,
    Object? amount = null,
    Object? time = null,
    Object? ingredients = null,
    Object? preparation = null,
  }) {
    return _then(_$_Recipe(
      dishName: null == dishName
          ? _value.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preparation: null == preparation
          ? _value._preparation
          : preparation // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recipe implements _Recipe {
  const _$_Recipe(
      {required this.dishName,
      this.url = '',
      this.category = '',
      this.amount = 0,
      this.time = 0,
      final List<String> ingredients = const [],
      final List<String> preparation = const []})
      : _ingredients = ingredients,
        _preparation = preparation;

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  final String dishName;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey()
  final int time;
  final List<String> _ingredients;
  @override
  @JsonKey()
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<String> _preparation;
  @override
  @JsonKey()
  List<String> get preparation {
    if (_preparation is EqualUnmodifiableListView) return _preparation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preparation);
  }

  @override
  String toString() {
    return 'Recipe(dishName: $dishName, url: $url, category: $category, amount: $amount, time: $time, ingredients: $ingredients, preparation: $preparation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recipe &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality()
                .equals(other._preparation, _preparation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dishName,
      url,
      category,
      amount,
      time,
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_preparation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      __$$_RecipeCopyWithImpl<_$_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final String dishName,
      final String url,
      final String category,
      final int amount,
      final int time,
      final List<String> ingredients,
      final List<String> preparation}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  String get dishName;
  @override
  String get url;
  @override
  String get category;
  @override
  int get amount;
  @override
  int get time;
  @override
  List<String> get ingredients;
  @override
  List<String> get preparation;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      throw _privateConstructorUsedError;
}
