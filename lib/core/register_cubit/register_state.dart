part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.error({String? errorMessage}) = _Error;
  const factory RegisterState.success() = _Success;
}
