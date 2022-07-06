import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/details_home_page.dart';

class DetialsHomeModule {
  DetialsHomeModule._();

  static final module = AppModule(
    routeName: '/details',
    page: (_) => const DetailsHomePage(),
  );
}
