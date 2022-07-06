import 'package:dio/dio.dart';
import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/cep_injection.dart';
import 'package:superapp_my_bloc/src/modules/counter/counter_injection.dart';
import 'package:superapp_my_bloc/src/modules/crud/crud_injections.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_list/bloc/contact_list_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_register/bloc/contact_register_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_update/bloc/contact_update_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/repositories/contact/contact_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/repositories/contact/contact_repository_impl.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/bloc/result_bloc.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/bloc/imc_bloc.dart';

Dependon get di => Dependon.instance;

injection() {
  final di = Dependon.instance;

  //services
  di.registerLazySingleton(() => Dio());

  //repositories
  di.registerLazySingleton<ContactRepository>(() => ContactRepositoryImpl(dio: get()));

  //controllers
  di.registerFactory(() => ImcBloc());
  di.registerFactory(() => ResultBloc());
  di.registerFactory(() => ContactListBloc(contactRepository: get()));
  di.registerFactory(() => ContactUpdateBloc(contactRepository: get()));
  di.registerFactory(() => ContactRegisterBloc(contactRepository: get()));

  CepInjection.injection();
  CrudInjections.injection();
  CounterInjection.injection();
}
