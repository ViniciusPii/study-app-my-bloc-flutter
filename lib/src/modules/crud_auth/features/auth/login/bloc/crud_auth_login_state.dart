part of 'crud_auth_login_bloc.dart';

abstract class CrudAuthLoginState {
  CrudAuthLoginState();
}

class CrudAuthLoginInitial extends CrudAuthLoginState {
  CrudAuthLoginInitial() : super();
}

class CrudAuthLoginLoading extends CrudAuthLoginState {
  CrudAuthLoginLoading() : super();
}

class CrudAuthLoginSuccess extends CrudAuthLoginState {
  CrudAuthLoginSuccess() : super();
}

class CrudAuthLoginError extends CrudAuthLoginState {
  CrudAuthLoginError({
    required this.message,
  }) : super();

  final String message;
}
