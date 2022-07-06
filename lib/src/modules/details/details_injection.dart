import 'package:superapp_my_bloc/src/injection.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/bloc/result_bloc.dart';

class DetailsInjection {
  DetailsInjection._();

  static injection() {
    di.registerFactory(() => ResultBloc());
  }
}
