import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';

abstract class CollaboratorRepository {
  Stream<List<CollaboratorModel>> getCollaborators();
  void removeCollaborator(CollaboratorModel collaborator);
  Future<void> removeAllCollaborator();
  Future<void> addCollaborator(CollaboratorModel collaborator);
  Future<void> updateCollaborator(CollaboratorModel collaborator);
}
