import 'package:firebase_auth/firebase_auth.dart';
import 'package:superapp_my_bloc/src/core/infra/navigator/app_navigator.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/routes/crud_auth_routes.dart';

class CrudAuthService {
  CrudAuthService({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  User? user;

  void authInit() async {
    await Future.delayed(const Duration(seconds: 2));
    _firebaseAuth.userChanges().listen(
      (User? user) {
        this.user = user;

        if (user == null) {
          AppNavigator.to.pushReplacementNamed(CrudAuthRoutes.crudAuthSocialLogin);
        } else {
          AppNavigator.to.pushReplacementNamed(CrudAuthRoutes.crudAuthHome);
        }
      },
    );
  }
}
