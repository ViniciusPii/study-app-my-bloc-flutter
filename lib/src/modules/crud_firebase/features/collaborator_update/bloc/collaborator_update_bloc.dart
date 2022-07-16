import 'package:superapp_my_bloc/src/core/infra/bloc.dart';
import 'package:superapp_my_bloc/src/core/exceptions/app_exception.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/repositories/collaborator/collaborator_repository.dart';

part 'collaborator_update_state.dart';

class CollaboratorUpdateBloc extends Bloc<CollaboratorUpdateState> {
  CollaboratorUpdateBloc({
    required CollaboratorRepository collaboratorRepository,
  })  : _collaboratorRepository = collaboratorRepository,
        super(CollaboratorUpdateInitial());

  final CollaboratorRepository _collaboratorRepository;

  Future<void> updateCollaborator(CollaboratorModel collaborator) async {
    emit(CollaboratorUpdateLoading());
    try {
      await _collaboratorRepository.updateCollaborator(collaborator);
      emit(CollaboratorUpdateSuccess());
    } on AppException catch (e) {
      emit(CollaboratorUpdateError(message: e.message));
    }
  }
}
