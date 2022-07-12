import 'package:superapp_my_bloc/src/core/bloc/bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/repositories/collaborator/collaborator_repository.dart';

part 'collaborator_list_state.dart';

class CollaboratorListBloc extends Bloc<CollaboratorListState> {
  CollaboratorListBloc({
    required CollaboratorRepository collaboratorRepository,
  })  : _collaboratorRepository = collaboratorRepository,
        super(CollaboratorListInitial());

  final CollaboratorRepository _collaboratorRepository;

  void getCollaborators() => _collaboratorRepository.getCollaborators().listen(
        (collaborators) {
          emit(CollaboratorListLoading());
          emit(CollaboratorListSuccess(collaborators: collaborators));
        },
      );

  Future<void> removeCollaborator(CollaboratorModel collaborator) async {
    emit(CollaboratorListLoading());
    await _collaboratorRepository.removeCollaborator(collaborator);
    emit(CollaboratorListSuccess(collaborators: state.collaborators));
  }

  Future<void> removeAllCollaborator() async {
    emit(CollaboratorListLoading());
    await _collaboratorRepository.removeAllCollaborator();
    emit(CollaboratorListSuccess(collaborators: state.collaborators));
  }
}
