part of 'forgot_pswd_cubit.dart';

@freezed
class ForgotPswdState with _$ForgotPswdState {
  const factory ForgotPswdState.initial() = _Initial;
  const factory ForgotPswdState.loading() = _Loading;
  const factory ForgotPswdState.error() = _Error;
  const factory ForgotPswdState.success() = _Success;
}
