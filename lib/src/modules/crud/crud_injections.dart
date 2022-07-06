import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/injection.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/bloc/user_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud/repositories/user/user_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud/repositories/user/user_repository_impl.dart';

class CrudInjections {
  CrudInjections._();

  static injection() {
    //repositories
    di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

    //controllers
    di.registerFactory(() => UserBloc(userRepository: get()));
  }
}
