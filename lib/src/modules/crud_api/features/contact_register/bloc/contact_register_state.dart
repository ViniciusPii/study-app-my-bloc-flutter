part of 'contact_register_bloc.dart';

abstract class ContactRegisterState {
  ContactRegisterState({
    required this.contact,
  });

  final ContactModel contact;
}

class ContactRegisterInitial extends ContactRegisterState {
  ContactRegisterInitial() : super(contact: ContactModel.contactEmpty);
}

class ContactRegisterLoading extends ContactRegisterState {
  ContactRegisterLoading() : super(contact: ContactModel.contactEmpty);
}

class ContactRegisterSuccess extends ContactRegisterState {
  ContactRegisterSuccess({
    required ContactModel contact,
  }) : super(contact: ContactModel.contactEmpty);
}

class ContactRegisterError extends ContactRegisterState {
  ContactRegisterError({
    required this.message,
  }) : super(contact: ContactModel.contactEmpty);

  final String message;
}
