part of 'user_cubit.dart';

abstract class UserState {}

class UserUnauthenticated extends UserState {}

class UserAuthenticated extends UserState {
  final User? user;
  final UserProfile? userProfile;

  UserAuthenticated({this.user, this.userProfile});
}
