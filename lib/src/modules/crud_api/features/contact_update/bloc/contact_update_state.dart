part of 'contact_update_bloc.dart';

abstract class ContactUpdateState {
  ContactUpdateState();
}

class ContactUpdateInitial extends ContactUpdateState {
  ContactUpdateInitial() : super();
}

class ContactUpdateLoading extends ContactUpdateState {
  ContactUpdateLoading() : super();
}

class ContactUpdateSuccess extends ContactUpdateState {
  ContactUpdateSuccess() : super();
}

class ContactUpdateError extends ContactUpdateState {
  ContactUpdateError({
    required this.message,
  }) : super();

  final String message;
}
