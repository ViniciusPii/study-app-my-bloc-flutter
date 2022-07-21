import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:superapp_my_bloc/src/core/exceptions/app_exception.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw AppException(message: 'Não foi possível realizar o login!');
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user!.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AppException(message: 'Não foi possível realizar o login!');
      } else if (e.code == 'email-already-in-use') {
        throw AppException(message: 'Não foi possível realizar o login!');
      }
    } catch (e) {
      throw AppException(message: 'Não foi possível realizar o login!');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    GoogleSignIn().disconnect();
  }
}
