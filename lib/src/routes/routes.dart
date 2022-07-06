import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/routes/cep_routes.dart';
import 'package:superapp_my_bloc/src/modules/counter/routes/counter_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud/routes/crud_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/routes/crud_api_routes.dart';
import 'package:superapp_my_bloc/src/modules/details/routes/details_routes.dart';
import 'package:superapp_my_bloc/src/modules/home/home_page.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/imc_home_page.dart';
import 'package:superapp_my_bloc/src/modules/imc/routes/imc_routes.dart';

class Routes {
  static String home = '/';

  static String imcHome = '/imc';

  final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),

    ...CepRoutes.routes,
    ...ImcRoutes.routes,
    ...CrudRoutes.routes,
    ...CounterRoutes.routes,
    ...DetailsRoutes.routes,
    ...CrudApiRoutes.routes,

    //imc
    imcHome: (context) => const ImcHomePage(),
  };
}
