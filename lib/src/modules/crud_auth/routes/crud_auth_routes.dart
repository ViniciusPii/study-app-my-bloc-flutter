import 'package:superapp_my_bloc/src/modules/crud_auth/features/auth/login/crud_auth_login_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/home/crud_auth_home_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/splash/crud_auth_splash_page.dart';

class CrudAuthRoutes {
  CrudAuthRoutes._();

  static const String crudAuthHome = '/crud/auth/home';
  static const String crudAuthLogin = '/crud/auth/login';
  static const String crudAuthSplash = '/crud/auth/splash';

  static final routes = {
    crudAuthLogin: (context) => CrudAuthLoginPage(),
    crudAuthSplash: (context) => CrudAuthSplashPage(),
    crudAuthHome: (context) => const CrudAuthHomePage(),
  };
}
