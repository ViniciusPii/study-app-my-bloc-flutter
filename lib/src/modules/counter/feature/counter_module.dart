import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/counter/feature/counter_home_page.dart';

class CounterModule {
  CounterModule._();

  static final module = AppModule(
    routeName: '/counter',
    page: (_) => const CounterHomePage(),
  );
}
