part of 'user_cubit.dart';

abstract class UserState {}

class UserUnauthenticated extends UserState {}

class UserAuthenticated extends UserState {
  final User user;

  UserAuthenticated(this.user);
}

class UserFilledWithData extends UserState {
  final UserProfile userProfile;

  UserFilledWithData(this.userProfile);
}
