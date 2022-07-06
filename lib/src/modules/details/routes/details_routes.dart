import 'package:superapp_my_bloc/src/modules/details/features/details/details_module.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/detials_home_module.dart';

class DetailsRoutes {
  DetailsRoutes._();

  static final routes = {
    ...DetailsModule.module.route,
    ...DetialsHomeModule.module.route,
  };
}
