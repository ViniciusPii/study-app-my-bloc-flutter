import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_list/contact_list_page.dart';

class ContactListRoute {
  ContactListRoute._();

  static final route = AppRoute(
    name: 'contact/list',
    page: (_) => const ContactListPage(),
  );
}
