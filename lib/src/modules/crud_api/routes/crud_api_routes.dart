import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_list/contact_list_module.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_register/contact_register_module.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_update/contact_update_module.dart';

class CrudApiRoutes {
  CrudApiRoutes._();

  static final routes = {
    ...ContactListModule.module.route,
    ...ContactUpdateModule.module.route,
    ...ContactRegisterModule.module.route,
  };
}
