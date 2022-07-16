import 'package:superapp_my_bloc/src/core/infra/bloc.dart';
import 'package:superapp_my_bloc/src/core/exceptions/app_exception.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/repositories/collaborator/collaborator_repository.dart';

part 'collaborator_register_state.dart';

class CollaboratorRegisterBloc extends Bloc<CollaboratorRegisterState> {
  CollaboratorRegisterBloc({
    required CollaboratorRepository collaboratorRepository,
  })  : _collaboratorRepository = collaboratorRepository,
        super(CollaboratorRegisterInitial());

  final CollaboratorRepository _collaboratorRepository;

  Future<void> addCollaborator(CollaboratorModel collaborator) async {
    emit(CollaboratorRegisterLoading());
    try {
      await _collaboratorRepository.addCollaborator(collaborator);
      emit(CollaboratorRegisterSuccess());
    } on AppException catch (e) {
      emit(CollaboratorRegisterError(message: e.message));
    }
  }
}
