import 'package:superapp_my_bloc/src/modules/cep_api/features/address_details/address_details_page.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/features/home/cep_home_page.dart';

class CepRoutes {
  CepRoutes._();

  static const String cepHome = '/cep';
  static const String cepResult = '/cep/result';

  static final routes = {
    cepHome: (context) => const CepHomePage(),
    cepResult: (context) => const AddressDetailsPage(),
  };
}
