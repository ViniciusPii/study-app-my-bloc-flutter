import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/details_home_page.dart';

class DetialsHomeRoute {
  DetialsHomeRoute._();

  static final route = AppRoute(
    name: '/details',
    page: (_) => const DetailsHomePage(),
  );
}
