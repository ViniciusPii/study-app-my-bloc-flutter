import 'package:firebase_auth/firebase_auth.dart';

import 'user_auth_repository.dart';

class UserAuthRepositoryImpl implements UserAuthRepository {
  UserAuthRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  User? getUser() => _firebaseAuth.currentUser;

  @override
  Future<void> changeName(String name) async {
    await getUser()!.updateDisplayName(name);
  }
}
