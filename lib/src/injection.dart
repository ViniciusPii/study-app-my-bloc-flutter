import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/modules/counter/bloc/counter_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud/home/bloc/user_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud/repositories/user/user_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud/repositories/user/user_repository_impl.dart';
import 'package:superapp_my_bloc/src/modules/details/home/bloc/result_bloc.dart';
import 'package:superapp_my_bloc/src/modules/imc/bloc/imc_bloc.dart';

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
