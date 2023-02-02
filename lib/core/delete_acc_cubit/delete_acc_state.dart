part of 'delete_acc_cubit.dart';

@freezed
class DeleteAccState with _$DeleteAccState {
  const factory DeleteAccState.initial() = _Initial;
  const factory DeleteAccState.loading() = _Loading;
  const factory DeleteAccState.error({String? errorMessage}) = _Error;
  const factory DeleteAccState.success() = _Success;
}
