part of 'collaborator_update_bloc.dart';

abstract class CollaboratorUpdateState {
  CollaboratorUpdateState();
}

class CollaboratorUpdateInitial extends CollaboratorUpdateState {
  CollaboratorUpdateInitial() : super();
}

class CollaboratorUpdateLoading extends CollaboratorUpdateState {
  CollaboratorUpdateLoading() : super();
}

class CollaboratorUpdateSuccess extends CollaboratorUpdateState {
  CollaboratorUpdateSuccess() : super();
}

class CollaboratorUpdateError extends CollaboratorUpdateState {
  CollaboratorUpdateError({
    required this.message,
  }) : super();

  final String message;
}
