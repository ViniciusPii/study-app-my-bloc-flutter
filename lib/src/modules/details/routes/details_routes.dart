import 'package:superapp_my_bloc/src/modules/details/features/details/details_result_page.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/details_home_page.dart';

class DetailsRoutes {
  DetailsRoutes._();

  static const String detailsHome = '/details/home';
  static const String detailsResult = '/details/result';

  static final routes = {
    detailsHome: (context) => const DetailsHomePage(),
    detailsResult: (context) => const DetailsResultPage(),
  };
}
