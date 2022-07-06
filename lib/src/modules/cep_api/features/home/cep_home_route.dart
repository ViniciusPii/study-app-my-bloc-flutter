import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/features/home/cep_home_page.dart';

class CepHomeRoute {
  CepHomeRoute._();

  static final route = AppRoute(
    name: 'cep',
    page: (_) => const CepHomePage(),
  );
}
