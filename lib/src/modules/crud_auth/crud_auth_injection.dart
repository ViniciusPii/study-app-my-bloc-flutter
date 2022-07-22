import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/injection.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/auth/create_account/bloc/crud_auth_create_account_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/auth/login/bloc/crud_auth_login_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/auth/login_email/bloc/crud_auth_login_email_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/home/bloc/crud_auth_home_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/splash/bloc/crud_auth_splash_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/auth/auth_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/auth/auth_repository_impl.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/user_auth/user_auth_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/user_auth/user_auth_repository_impl.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/services/crud_auth_service.dart';

class CrudAuthInjection {
  CrudAuthInjection._();

  static void injection() {
    //servies
    di.registerLazySingleton(() => CrudAuthService(firebaseAuth: get()));

    //repositories
    di.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        firebaseAuth: get(),
      ),
    );
    di.registerLazySingleton<UserAuthRepository>(
      () => UserAuthRepositoryImpl(
        firebaseAuth: get(),
      ),
    );

    //controllers
    di.registerFactory(
      () => CrudAuthHomeBloc(
        userAuthRepository: get(),
        authRepository: get(),
      ),
    );
    di.registerFactory(
      () => CrudAuthCreateAccountBloc(
        authRepository: get(),
        userAuthRepository: get(),
      ),
    );
    di.registerFactory(() => CrudAuthLoginBloc(authRepository: get()));
    di.registerFactory(() => CrudAuthSplashBloc(crudAuthService: get()));
    di.registerFactory(() => CrudAuthLoginEmailBloc(authRepository: get()));
  }
}
