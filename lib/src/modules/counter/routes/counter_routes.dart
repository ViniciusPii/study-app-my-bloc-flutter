import 'package:superapp_my_bloc/src/modules/counter/feature/counter_home_page.dart';

class CounterRoutes {
  CounterRoutes._();

  static const String counterHome = '/counter';

  static final routes = {
    counterHome: (context) => const CounterHomePage(),
  };
}
