import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/home/features/home_page.dart';

class HomeRoute {
  HomeRoute._();

  static final route = AppRoute(
    name: '/',
    page: (_) => const HomePage(),
  );
}
