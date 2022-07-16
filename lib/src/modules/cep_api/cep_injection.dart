import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/injection.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/features/home/bloc/address_bloc.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/repositories/address/address_repository.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/repositories/address/address_repository_impl.dart';

class CepInjection {
  CepInjection._();

  static injection() {
    //repositories
    di.registerLazySingleton<AddressRepository>(() => AddressRepositoryImpl(dio: get()));

    //controllers
    di.registerFactory(() => AddressBloc(addressRepository: get()));
  }
}
