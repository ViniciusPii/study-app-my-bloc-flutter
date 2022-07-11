import 'package:superapp_my_bloc/src/modules/imc/features/imc_home_page.dart';

class ImcRoutes {
  ImcRoutes._();

  static const String imcHome = '/imc';

  static final routes = {
    imcHome: (context) => const ImcHomePage(),
  };
}
