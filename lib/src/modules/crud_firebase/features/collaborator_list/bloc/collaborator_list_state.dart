part of 'collaborator_list_bloc.dart';

abstract class CollaboratorListState {
  CollaboratorListState({
    required this.collaborators,
  });

  final List<CollaboratorModel> collaborators;
}

class CollaboratorListInitial extends CollaboratorListState {
  CollaboratorListInitial() : super(collaborators: []);
}

class CollaboratorListLoading extends CollaboratorListState {
  CollaboratorListLoading() : super(collaborators: []);
}

class CollaboratorListSuccess extends CollaboratorListState {
  CollaboratorListSuccess({
    required List<CollaboratorModel> collaborators,
  }) : super(collaborators: collaborators);
}

class CollaboratorListError extends CollaboratorListState {
  CollaboratorListError({
    required this.message,
  }) : super(collaborators: []);

  final String message;
}
