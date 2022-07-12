import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';

abstract class CollaboratorRepository {
  Stream<List<CollaboratorModel>> getCollaborators();
  Future<void> removeAllCollaborator();
  Future<void> addCollaborator(CollaboratorModel collaborator);
  Future<void> updateCollaborator(CollaboratorModel collaborator);
  Future<void> removeCollaborator(CollaboratorModel collaborator);
}
