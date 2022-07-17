part of 'contact_list_bloc.dart';

abstract class ContactListState {
  ContactListState({
    required this.contacts,
  });

  final List<ContactModel> contacts;
}

class ContactListInitial extends ContactListState {
  ContactListInitial() : super(contacts: []);
}

class ContactListLoading extends ContactListState {
  ContactListLoading() : super(contacts: []);
}

class ContactListSuccess extends ContactListState {
  ContactListSuccess({
    required List<ContactModel> contacts,
  }) : super(contacts: contacts);
}

class ContactListError extends ContactListState {
  ContactListError({
    required this.message,
  }) : super(contacts: []);

  final String message;
}

class ContactListRemoveError extends ContactListState {
  ContactListRemoveError({
    required this.message,
    required List<ContactModel> contacts,
  }) : super(contacts: contacts);

  final String message;
}
