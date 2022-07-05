part of 'contact_register_bloc.dart';

abstract class ContactRegisterState {
  ContactRegisterState();
}

class ContactRegisterInitial extends ContactRegisterState {
  ContactRegisterInitial() : super();
}

class ContactRegisterLoading extends ContactRegisterState {
  ContactRegisterLoading() : super();
}

class ContactRegisterSuccess extends ContactRegisterState {
  ContactRegisterSuccess() : super();
}

class ContactRegisterError extends ContactRegisterState {
  ContactRegisterError({
    required this.message,
  }) : super();

  final String message;
}
