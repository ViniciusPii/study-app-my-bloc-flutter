part of 'crud_auth_login_email_bloc.dart';

abstract class CrudAuthLoginEmailState {
  CrudAuthLoginEmailState();
}

class CrudAuthLoginEmailInitial extends CrudAuthLoginEmailState {
  CrudAuthLoginEmailInitial() : super();
}

class CrudAuthLoginEmailLoading extends CrudAuthLoginEmailState {
  CrudAuthLoginEmailLoading() : super();
}

class CrudAuthLoginEmailSuccess extends CrudAuthLoginEmailState {
  CrudAuthLoginEmailSuccess() : super();
}

class CrudAuthLoginEmailError extends CrudAuthLoginEmailState {
  CrudAuthLoginEmailError({
    required this.message,
  }) : super();

  final String message;
}
