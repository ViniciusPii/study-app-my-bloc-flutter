import 'package:superapp_my_bloc/src/modules/imc/features/imc_module.dart';

class ImcRoutes {
  ImcRoutes._();

  static final routes = {
    ...ImcModule.module.route,
  };
}
