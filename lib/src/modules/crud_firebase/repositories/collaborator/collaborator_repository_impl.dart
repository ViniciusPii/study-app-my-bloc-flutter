import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';

import 'collaborator_repository.dart';

class CollaboratorRepositoryImpl implements CollaboratorRepository {
  CollaboratorRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  late final collection = _firestore.collection('collaborators');

  @override
  Future<void> addCollaborator(CollaboratorModel collaborator) async {
    await collection.doc().set(collaborator.toJson());
  }
}
