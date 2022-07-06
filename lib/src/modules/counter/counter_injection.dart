import 'package:superapp_my_bloc/src/injection.dart';
import 'package:superapp_my_bloc/src/modules/counter/feature/bloc/counter_bloc.dart';

class CounterInjection {
  CounterInjection._();

  static injection() {
    //controllers
    di.registerFactory(() => CounterBloc());
  }
}
