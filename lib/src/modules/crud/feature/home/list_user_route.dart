import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/home/list_user_page.dart';

class ListUserRoute {
  ListUserRoute._();

  static final route = AppRoute(
    name: 'crud/list',
    page: (_) => const ListUserPage(),
  );
}
