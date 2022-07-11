import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';

abstract class CollaboratorRepository {
  Future<void> addCollaborator(CollaboratorModel collaborator);
}
