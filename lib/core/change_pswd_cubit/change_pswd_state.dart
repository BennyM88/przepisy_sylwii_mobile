part of 'change_pswd_cubit.dart';

@freezed
class ChangePswdState with _$ChangePswdState {
  const factory ChangePswdState.initial() = _Initial;
  const factory ChangePswdState.loading() = _Loading;
  const factory ChangePswdState.error({String? errorMessage}) = _Error;
  const factory ChangePswdState.success() = _Success;
}
