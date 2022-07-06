import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/form/form_user_page.dart';

class FormUserRoute {
  FormUserRoute._();

  static final route = AppRoute(
    name: 'crud/form',
    page: (_) => const FormUserPage(),
  );
}
