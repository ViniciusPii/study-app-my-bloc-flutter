import 'package:firebase_auth/firebase_auth.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/models/request/user_request_model.dart';

abstract class AuthRepository {
  Future<void> signOut();
  Future<UserCredential> signInWithGoogle();
  Future<void> signInWithEmailAndPassword(UserRequestModel user);
  Future<void> createUserWithEmailAndPassword(UserRequestModel user);
}
