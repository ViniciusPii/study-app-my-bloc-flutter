import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/routes/cep_routes.dart';
import 'package:superapp_my_bloc/src/modules/counter/routes/counter_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud/routes/crud_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/routes/crud_api_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/routes/crud_firebase_routes.dart';
import 'package:superapp_my_bloc/src/modules/details/routes/details_routes.dart';
import 'package:superapp_my_bloc/src/modules/home/routes/home_routes.dart';
import 'package:superapp_my_bloc/src/modules/imc/routes/imc_routes.dart';

class Routes {
  final Map<String, WidgetBuilder> routes = {
    ...CepRoutes.routes,
    ...ImcRoutes.routes,
    ...HomeRoutes.routes,
    ...CrudRoutes.routes,
    ...CounterRoutes.routes,
    ...DetailsRoutes.routes,
    ...CrudApiRoutes.routes,
    ...CrudFirebaseRoutes.routes,
  };
}
