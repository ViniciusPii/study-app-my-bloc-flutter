import 'package:firebase_auth/firebase_auth.dart';

abstract class UserAuthRepository {
  User? getUser();
  Future<void> changeName(String name);
}
