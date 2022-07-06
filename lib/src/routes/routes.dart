import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/routes/cep_routes.dart';
import 'package:superapp_my_bloc/src/modules/counter/routes/counter_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud/routes/crud_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/routes/crud_api_routes.dart';
import 'package:superapp_my_bloc/src/modules/details/features/details/details_result_page.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/details_home_page.dart';
import 'package:superapp_my_bloc/src/modules/home/home_page.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/imc_home_page.dart';

class Routes {
  static String home = '/';

  static String imcHome = '/imc';

  static String detailsHome = '/details';
  static String detailsResult = '/details/result';

  final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),

    ...CepRoutes.routes,
    ...CrudRoutes.routes,
    ...CounterRoutes.routes,
    ...CrudApiRoutes.routes,

    //imc
    imcHome: (context) => const ImcHomePage(),

    //details
    detailsHome: (context) => const DetailsHomePage(),
    detailsResult: (context) => const DetailsResultPage(),
  };
}
