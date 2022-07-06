import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_register/contact_register_page.dart';

class ContactRegisterModule {
  ContactRegisterModule._();

  static final module = AppModule(
    routeName: 'contact/register',
    page: (_) => const ContactRegisterPage(),
  );
}
