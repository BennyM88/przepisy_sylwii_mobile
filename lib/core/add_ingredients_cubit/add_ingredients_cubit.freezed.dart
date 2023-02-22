// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_ingredients_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddIngredientsState {
  List<String> get ingredients => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddIngredientsStateCopyWith<AddIngredientsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddIngredientsStateCopyWith<$Res> {
  factory $AddIngredientsStateCopyWith(
          AddIngredientsState value, $Res Function(AddIngredientsState) then) =
      _$AddIngredientsStateCopyWithImpl<$Res, AddIngredientsState>;
  @useResult
  $Res call({List<String> ingredients});
}

/// @nodoc
class _$AddIngredientsStateCopyWithImpl<$Res, $Val extends AddIngredientsState>
    implements $AddIngredientsStateCopyWith<$Res> {
  _$AddIngredientsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddIngredientsStateCopyWith<$Res>
    implements $AddIngredientsStateCopyWith<$Res> {
  factory _$$_AddIngredientsStateCopyWith(_$_AddIngredientsState value,
          $Res Function(_$_AddIngredientsState) then) =
      __$$_AddIngredientsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> ingredients});
}

/// @nodoc
class __$$_AddIngredientsStateCopyWithImpl<$Res>
    extends _$AddIngredientsStateCopyWithImpl<$Res, _$_AddIngredientsState>
    implements _$$_AddIngredientsStateCopyWith<$Res> {
  __$$_AddIngredientsStateCopyWithImpl(_$_AddIngredientsState _value,
      $Res Function(_$_AddIngredientsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
  }) {
    return _then(_$_AddIngredientsState(
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_AddIngredientsState implements _AddIngredientsState {
  const _$_AddIngredientsState({final List<String> ingredients = const []})
      : _ingredients = ingredients;

  final List<String> _ingredients;
  @override
  @JsonKey()
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'AddIngredientsState(ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddIngredientsState &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddIngredientsStateCopyWith<_$_AddIngredientsState> get copyWith =>
      __$$_AddIngredientsStateCopyWithImpl<_$_AddIngredientsState>(
          this, _$identity);
}

abstract class _AddIngredientsState implements AddIngredientsState {
  const factory _AddIngredientsState({final List<String> ingredients}) =
      _$_AddIngredientsState;

  @override
  List<String> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$_AddIngredientsStateCopyWith<_$_AddIngredientsState> get copyWith =>
      throw _privateConstructorUsedError;
}
