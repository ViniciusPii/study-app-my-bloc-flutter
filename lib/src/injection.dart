import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/cep_injection.dart';
import 'package:superapp_my_bloc/src/modules/counter/counter_injection.dart';
import 'package:superapp_my_bloc/src/modules/crud/crud_injections.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/crud_api_injection.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/crud_firebase_injection.dart';
import 'package:superapp_my_bloc/src/modules/details/details_injection.dart';
import 'package:superapp_my_bloc/src/modules/imc/imc_injection.dart';

Dependon get di => Dependon.instance;

injection() {
  //services
  di.registerLazySingleton(() => Dio());
  di.registerLazySingleton(() => FirebaseAuth.instance);
  di.registerLazySingleton(() => FirebaseFirestore.instance);

  //injection modules
  CepInjection.injection();
  ImcInjection.injection();
  CrudInjections.injection();
  DetailsInjection.injection();
  CrudApiInjection.injection();
  CounterInjection.injection();
  CrudFirebaseInjection.injection();
}
