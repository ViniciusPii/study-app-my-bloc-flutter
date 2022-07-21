import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signOut();
  Future<UserCredential> signInWithGoogle();
  Future<void> createUserWithEmailAndPassword(String name, String email, String password);
}
