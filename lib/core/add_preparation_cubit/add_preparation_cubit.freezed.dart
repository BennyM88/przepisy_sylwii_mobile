// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_preparation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPreparationState {
  List<String> get preparation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPreparationStateCopyWith<AddPreparationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPreparationStateCopyWith<$Res> {
  factory $AddPreparationStateCopyWith(
          AddPreparationState value, $Res Function(AddPreparationState) then) =
      _$AddPreparationStateCopyWithImpl<$Res, AddPreparationState>;
  @useResult
  $Res call({List<String> preparation});
}

/// @nodoc
class _$AddPreparationStateCopyWithImpl<$Res, $Val extends AddPreparationState>
    implements $AddPreparationStateCopyWith<$Res> {
  _$AddPreparationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preparation = null,
  }) {
    return _then(_value.copyWith(
      preparation: null == preparation
          ? _value.preparation
          : preparation // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddPreparationStateCopyWith<$Res>
    implements $AddPreparationStateCopyWith<$Res> {
  factory _$$_AddPreparationStateCopyWith(_$_AddPreparationState value,
          $Res Function(_$_AddPreparationState) then) =
      __$$_AddPreparationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> preparation});
}

/// @nodoc
class __$$_AddPreparationStateCopyWithImpl<$Res>
    extends _$AddPreparationStateCopyWithImpl<$Res, _$_AddPreparationState>
    implements _$$_AddPreparationStateCopyWith<$Res> {
  __$$_AddPreparationStateCopyWithImpl(_$_AddPreparationState _value,
      $Res Function(_$_AddPreparationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preparation = null,
  }) {
    return _then(_$_AddPreparationState(
      preparation: null == preparation
          ? _value._preparation
          : preparation // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_AddPreparationState implements _AddPreparationState {
  const _$_AddPreparationState({final List<String> preparation = const []})
      : _preparation = preparation;

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
    return 'AddPreparationState(preparation: $preparation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPreparationState &&
            const DeepCollectionEquality()
                .equals(other._preparation, _preparation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_preparation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPreparationStateCopyWith<_$_AddPreparationState> get copyWith =>
      __$$_AddPreparationStateCopyWithImpl<_$_AddPreparationState>(
          this, _$identity);
}

abstract class _AddPreparationState implements AddPreparationState {
  const factory _AddPreparationState({final List<String> preparation}) =
      _$_AddPreparationState;

  @override
  List<String> get preparation;
  @override
  @JsonKey(ignore: true)
  _$$_AddPreparationStateCopyWith<_$_AddPreparationState> get copyWith =>
      throw _privateConstructorUsedError;
}
