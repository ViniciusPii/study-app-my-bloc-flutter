import 'package:superapp_my_bloc/src/injection.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/bloc/imc_bloc.dart';

class ImcInjection {
  ImcInjection._();

  static injection() {
    di.registerFactory(() => ImcBloc());
  }
}
