import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String email,
    @Default('') String accountCreated,
    @Default('') String firstName,
    @Default('') String uid,
  }) = _UserProfile;
}
