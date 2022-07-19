part of 'crud_auth_home_bloc.dart';

abstract class CrudAuthHomeState {
  CrudAuthHomeState();
}

class CrudAuthHomeInitial extends CrudAuthHomeState {
  CrudAuthHomeInitial() : super();
}

class CrudAuthHomeLoading extends CrudAuthHomeState {
  CrudAuthHomeLoading() : super();
}

class CrudAuthHomeSuccess extends CrudAuthHomeState {
  CrudAuthHomeSuccess() : super();
}

class CrudAuthHomeError extends CrudAuthHomeState {
  CrudAuthHomeError({
    required this.message,
  }) : super();

  final String message;
}
