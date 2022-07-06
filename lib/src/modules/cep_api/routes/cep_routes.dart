import 'package:superapp_my_bloc/src/modules/cep_api/features/address_details/address_module.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/features/home/cep_module.dart';

class CepRoutes {
  CepRoutes._();

  static final routes = {
    ...CepModule.module.route,
    ...AddressModule.module.route,
  };
}
