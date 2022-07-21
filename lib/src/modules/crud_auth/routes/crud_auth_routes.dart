import 'package:superapp_my_bloc/src/modules/crud_auth/features/auth/create_account/crud_auth_create_account_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/auth/login/crud_auth_login_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/auth/login_email/crud_auth_login_email_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/home/crud_auth_home_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/splash/crud_auth_splash_page.dart';

class CrudAuthRoutes {
  CrudAuthRoutes._();

  static const String crudAuthHome = '/crud/auth/home';
  static const String crudAuthLogin = '/crud/auth/login';
  static const String crudAuthSplash = '/crud/auth/splash';
  static const String crudAuthLoginEmail = '/crud/auth/login/email';
  static const String crudAuthCreateAccount = '/crud/auth/create-account';

  static final routes = {
    crudAuthHome: (context) => CrudAuthHomePage(),
    crudAuthLogin: (context) => CrudAuthLoginPage(),
    crudAuthSplash: (context) => CrudAuthSplashPage(),
    crudAuthLoginEmail: (context) => const CrudAuthLoginEmailPage(),
    crudAuthCreateAccount: (context) => CrudAuthCreateAccountPage(),
  };
}
