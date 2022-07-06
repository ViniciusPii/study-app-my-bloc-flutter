import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/imc_home_page.dart';

class ImcHomeRoute {
  ImcHomeRoute._();

  static final route = AppRoute(
    name: '/imc',
    page: (_) => const ImcHomePage(),
  );
}
