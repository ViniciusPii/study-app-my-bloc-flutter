import 'package:superapp_my_bloc/src/modules/cep_api/features/address_details/address_details_route.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/features/home/cep_home_route.dart';

class CepRoutes {
  CepRoutes._();

  static final routes = {
    ...CepHomeRoute.route.buildRoute,
    ...AddressDetailsRoute.route.buildRoute,
  };
}
