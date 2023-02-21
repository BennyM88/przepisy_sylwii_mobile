part of 'add_photo_cubit.dart';

@freezed
class AddPhotoState with _$AddPhotoState {
  const factory AddPhotoState.initial() = _Initial;
  const factory AddPhotoState.loading() = _Loading;
  const factory AddPhotoState.error() = _Error;
  const factory AddPhotoState.success({required String imageUrl}) = _Success;
}
