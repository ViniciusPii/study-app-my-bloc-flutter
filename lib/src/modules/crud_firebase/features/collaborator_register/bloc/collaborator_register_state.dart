part of 'collaborator_register_bloc.dart';

abstract class CollaboratorRegisterState {
  CollaboratorRegisterState();
}

class CollaboratorRegisterInitial extends CollaboratorRegisterState {
  CollaboratorRegisterInitial() : super();
}

class CollaboratorRegisterLoading extends CollaboratorRegisterState {
  CollaboratorRegisterLoading() : super();
}

class CollaboratorRegisterSuccess extends CollaboratorRegisterState {
  CollaboratorRegisterSuccess() : super();
}

class CollaboratorRegisterError extends CollaboratorRegisterState {
  CollaboratorRegisterError({
    required this.message,
  }) : super();

  final String message;
}
