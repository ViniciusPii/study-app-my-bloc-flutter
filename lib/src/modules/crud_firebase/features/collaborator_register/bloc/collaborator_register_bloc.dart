import 'package:superapp_my_bloc/src/core/bloc/bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/repositories/collaborator/collaborator_repository.dart';

part 'collaborator_register_state.dart';

class CollaboratorRegisterBloc extends Bloc<CollaboratorRegisterState> {
  CollaboratorRegisterBloc({
    required CollaboratorRepository collaboratorRepository,
  })  : _collaboratorRepository = collaboratorRepository,
        super(CollaboratorRegisterInitial());

  final CollaboratorRepository _collaboratorRepository;

  void addCollaborator(CollaboratorModel collaborator) {
    _collaboratorRepository.addCollaborator(collaborator);
  }
}
