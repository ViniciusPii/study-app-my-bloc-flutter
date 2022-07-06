import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/imc_home_page.dart';

class ImcModule {
  ImcModule._();

  static final module = AppModule(
    routeName: '/imc',
    page: (_) => const ImcHomePage(),
  );
}
