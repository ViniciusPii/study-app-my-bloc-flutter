import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/cep_injection.dart';
import 'package:superapp_my_bloc/src/modules/counter/counter_injection.dart';
import 'package:superapp_my_bloc/src/modules/crud/crud_injections.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/crud_api_injection.dart';
import 'package:superapp_my_bloc/src/modules/details/details_injection.dart';
import 'package:superapp_my_bloc/src/modules/imc/imc_injection.dart';

Dependon get di => Dependon.instance;

injection() {
  final di = Dependon.instance;

  //services
  di.registerLazySingleton(() => Dio());
  di.registerLazySingleton(() => FirebaseFirestore.instance);

  CepInjection.injection();
  ImcInjection.injection();
  CrudInjections.injection();
  DetailsInjection.injection();
  CrudApiInjection.injection();
  CounterInjection.injection();
}
