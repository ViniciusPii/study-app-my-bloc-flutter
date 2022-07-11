import 'package:superapp_my_bloc/src/modules/crud/feature/form/form_user_page.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/home/list_user_page.dart';

class CrudRoutes {
  CrudRoutes._();

  static const String listUser = '/user/list';
  static const String formUser = '/user/form';

  static final routes = {
    listUser: (context) => const ListUserPage(),
    formUser: (context) => const FormUserPage(),
  };
}
