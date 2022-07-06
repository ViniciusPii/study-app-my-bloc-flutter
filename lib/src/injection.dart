import 'package:dio/dio.dart';
import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/cep_injection.dart';
import 'package:superapp_my_bloc/src/modules/counter/counter_injection.dart';
import 'package:superapp_my_bloc/src/modules/crud/crud_injections.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/crud_api_injection.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/bloc/result_bloc.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/bloc/imc_bloc.dart';

Dependon get di => Dependon.instance;

injection() {
  final di = Dependon.instance;

  //services
  di.registerLazySingleton(() => Dio());

  //controllers
  di.registerFactory(() => ImcBloc());
  di.registerFactory(() => ResultBloc());

  CepInjection.injection();
  CrudInjections.injection();
  CrudApiInjection.injection();
  CounterInjection.injection();
}
