import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_list/contact_list_route.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_register/contact_register_route.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_update/contact_update_route.dart';

class CrudApiRoutes {
  CrudApiRoutes._();

  static final routes = {
    ...ContactListRoute.route.buildRoute,
    ...ContactUpdateRoute.route.buildRoute,
    ...ContactRegisterRoute.route.buildRoute,
  };
}
