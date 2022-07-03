part of 'user_bloc.dart';

abstract class UserState {
  UserState({
    required this.users,
  });

  final List<UserModel> users;
}

class UserInitial extends UserState {
  UserInitial() : super(users: []);
}

class UserLoading extends UserState {
  UserLoading() : super(users: []);
}

class UserSuccess extends UserState {
  UserSuccess({required List<UserModel> user}) : super(users: user);
}

class UserError extends UserState {
  UserError({
    required this.message,
  }) : super(users: []);

  final String message;
}
