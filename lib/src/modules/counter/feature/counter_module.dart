import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/counter/feature/counter_home_page.dart';

class CounterModule {
  static final module = AppModule(
    routeName: '/counter',
    page: const CounterHomePage(),
  );
}
