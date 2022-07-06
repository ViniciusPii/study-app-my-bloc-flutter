import 'package:superapp_my_bloc/src/modules/crud/feature/form/form_user_route.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/home/list_user_route.dart';

class CrudRoutes {
  CrudRoutes._();

  static final routes = {
    ...FormUserRoute.route.buildRoute,
    ...ListUserRoute.route.buildRoute,
  };
}
