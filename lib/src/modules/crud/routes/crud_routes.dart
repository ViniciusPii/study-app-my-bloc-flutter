import 'package:superapp_my_bloc/src/modules/crud/feature/form/form_module.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/home/list_user_module.dart';

class CrudRoutes {
  CrudRoutes._();

  static final routes = {
    ...FormModule.module.route,
    ...ListUserModule.module.route,
  };
}
