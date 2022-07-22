import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:superapp_my_bloc/src/core/exceptions/app_exception.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/models/request/user_request_model.dart';

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
  Future<void> createUserWithEmailAndPassword(UserRequestModel user) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AppException(message: 'Email já utilizado!');
      } else if (e.code == 'invalid-email') {
        throw AppException(message: 'Formato de email inválido!');
      } else if (e.code == 'operation-not-allowed') {
        throw AppException(
            message: 'Conta de email desabilitada, entre em contato com o servidor!');
      } else if (e.code == 'weak-password') {
        throw AppException(message: 'Sua senha deve ter no mínimo 6 caracteres!');
      }
    } catch (e) {
      throw AppException(message: 'Não foi possível realizar o login!');
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(UserRequestModel user) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw AppException(message: 'Formato de email inválido!');
      } else if (e.code == 'user-disabled') {
        throw AppException(message: 'Usuário desabilitado!');
      } else if (e.code == 'user-not-found') {
        throw AppException(message: 'Usuário ou senha incorretos!');
      } else if (e.code == 'wrong-password') {
        throw AppException(message: 'Usuário ou senha incorretos!');
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
