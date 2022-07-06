import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/features/address_details/address_details_page.dart';

class AddressModule {
  AddressModule._();

  static final module = AppModule(
    routeName: 'cep/details',
    page: (_) => const AddressDetailsPage(),
  );
}
