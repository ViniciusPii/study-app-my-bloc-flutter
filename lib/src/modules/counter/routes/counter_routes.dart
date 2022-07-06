import 'package:superapp_my_bloc/src/modules/counter/feature/counter_module.dart';

class CounterRoutes {
  CounterRoutes._();

  static final routes = {
    ...CounterModule.module.route,
  };
}
