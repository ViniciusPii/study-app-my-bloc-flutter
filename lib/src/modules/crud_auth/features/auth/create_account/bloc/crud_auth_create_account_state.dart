part of 'crud_auth_create_account_bloc.dart';

abstract class CrudAuthCreateAccountState {
  CrudAuthCreateAccountState();
}

class CrudAuthCreateAccountInitial extends CrudAuthCreateAccountState {
  CrudAuthCreateAccountInitial() : super();
}

class CrudAuthCreateAccountLoading extends CrudAuthCreateAccountState {
  CrudAuthCreateAccountLoading() : super();
}

class CrudAuthCreateAccountSuccess extends CrudAuthCreateAccountState {
  CrudAuthCreateAccountSuccess() : super();
}

class CrudAuthCreateAccountError extends CrudAuthCreateAccountState {
  CrudAuthCreateAccountError({
    required this.message,
  }) : super();

  final String message;
}
