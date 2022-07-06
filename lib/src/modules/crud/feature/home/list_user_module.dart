import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/home/list_user_page.dart';

class ListUserModule {
  ListUserModule._();

  static final module = AppModule(
    routeName: 'crud/list',
    page: (_) => const ListUserPage(),
  );
}
