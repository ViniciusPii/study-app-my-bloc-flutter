import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/features/home/cep_home_page.dart';

class CepModule {
  CepModule._();

  static final module = AppModule(
    routeName: 'cep',
    page: (_) => const CepHomePage(),
  );
}
