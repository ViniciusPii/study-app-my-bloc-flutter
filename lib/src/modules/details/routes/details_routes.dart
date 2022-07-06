import 'package:superapp_my_bloc/src/modules/details/features/details/details_result_route.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/detials_home_route.dart';

class DetailsRoutes {
  DetailsRoutes._();

  static final routes = {
    ...DetailsResultRoute.route.buildRoute,
    ...DetialsHomeRoute.route.buildRoute,
  };
}
