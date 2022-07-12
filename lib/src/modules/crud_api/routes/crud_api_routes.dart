import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_list/contact_list_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_register/contact_register_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_update/contact_update_page.dart';

class CrudApiRoutes {
  CrudApiRoutes._();

  static const String listContact = '/contact/list';
  static const String updateContact = '/contact/update';
  static const String registerContact = '/contact/register';

  static final routes = {
    listContact: (context) => const ContactListPage(),
    updateContact: (context) {
      final args = Utils.getArgs(context);

      return ContactUpdatePage(args: args);
    },
    registerContact: (context) => const ContactRegisterPage(),
  };
}
