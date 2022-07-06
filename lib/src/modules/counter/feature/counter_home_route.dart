import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/counter/feature/counter_home_page.dart';

class CounterHomeRoute {
  CounterHomeRoute._();

  static final route = AppRoute(
    name: '/counter',
    page: (_) => const CounterHomePage(),
  );
}
