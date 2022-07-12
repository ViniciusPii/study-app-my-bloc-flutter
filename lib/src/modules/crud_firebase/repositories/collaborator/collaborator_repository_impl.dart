import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:superapp_my_bloc/src/core/exceptions/app_exception.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';

import 'collaborator_repository.dart';

class CollaboratorRepositoryImpl implements CollaboratorRepository {
  CollaboratorRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  late final _db = _firestore.collection('collaborators');

  @override
  Future<void> addCollaborator(CollaboratorModel collaborator) async {
    try {
      await _db.doc().set(collaborator.toJson()).timeout(const Duration(seconds: 3));
    } catch (e) {
      throw AppException(message: 'Sua conexão apresenta instabilidades!');
    }
  }

  @override
  Stream<List<CollaboratorModel>> getCollaborators() =>
      _db.orderBy('timestamp', descending: true).snapshots().map((querySnapshot) =>
          querySnapshot.docs.map((doc) => CollaboratorModel.fromDocument(doc)).toList());

  @override
  Future<void> removeCollaborator(CollaboratorModel collaborator) =>
      _db.doc(collaborator.id).delete();

  @override
  Future<void> removeAllCollaborator() async {
    WriteBatch batch = _firestore.batch();

    await _db.get().then((querySnapshot) {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        batch.delete(doc.reference);
      }
    });

    await batch.commit();
  }
}
