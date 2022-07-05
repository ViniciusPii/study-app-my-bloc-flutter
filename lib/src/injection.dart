import 'package:dio/dio.dart';
import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/features/home/bloc/address_bloc.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/repositories/address/address_repository.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/repositories/address/address_repository_impl.dart';
import 'package:superapp_my_bloc/src/modules/counter/feature/bloc/counter_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/bloc/user_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud/repositories/user/user_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud/repositories/user/user_repository_impl.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_list/bloc/contact_list_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/repositories/contact/contact_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/repositories/contact/contact_repository_impl.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/bloc/result_bloc.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/bloc/imc_bloc.dart';

injection() {
  final di = Dependon.instance;

  //services
  di.registerLazySingleton(() => Dio());

  //repositories
  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  di.registerLazySingleton<ContactRepository>(() => ContactRepositoryImpl(dio: get()));
  di.registerLazySingleton<AddressRepository>(() => AddressRepositoryImpl(dio: get()));

  //controllers
  di.registerFactory(() => ImcBloc());
  di.registerFactory(() => ResultBloc());
  di.registerFactory(() => CounterBloc());
  di.registerFactory(() => UserBloc(userRepository: get()));
  di.registerFactory(() => AddressBloc(addressRepository: get()));
  di.registerFactory(() => ContactListBloc(contactRepository: get()));
}
