import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/modules/counter/bloc/counter_bloc.dart';

injection() {
  final di = Dependon.instance;

  //repositories

  //controllers
  di.registerFactory(() => CounterBloc());
}
