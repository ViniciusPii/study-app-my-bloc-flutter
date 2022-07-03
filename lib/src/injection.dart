import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/modules/counter/feature/bloc/counter_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/bloc/user_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud/repositories/user/user_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud/repositories/user/user_repository_impl.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/bloc/result_bloc.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/bloc/imc_bloc.dart';

injection() {
  final di = Dependon.instance;

  //repositories
  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  //controllers
  di.registerFactory(() => ImcBloc());
  di.registerFactory(() => ResultBloc());
  di.registerFactory(() => CounterBloc());
  di.registerFactory(() => UserBloc(userRepository: get()));
}
