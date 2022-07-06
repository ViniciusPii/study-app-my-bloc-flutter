import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/routes/cep_routes.dart';
import 'package:superapp_my_bloc/src/modules/counter/routes/counter_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud/routes/crud_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_list/contact_list_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_register/contact_register_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_update/contact_update_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/models/contact_args_model.dart';
import 'package:superapp_my_bloc/src/modules/details/features/details/details_result_page.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/details_home_page.dart';
import 'package:superapp_my_bloc/src/modules/home/home_page.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/imc_home_page.dart';

class Routes {
  static String home = '/';

  static String imcHome = '/imc';

  static String detailsHome = '/details';
  static String detailsResult = '/details/result';

  static String contactHome = '/contact';
  static String contactUpdate = '/contact/update';
  static String contactRegister = '/contact/register';

  final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),

    //counter
    ...CepRoutes.routes,
    ...CrudRoutes.routes,
    ...CounterRoutes.routes,
    //imc
    imcHome: (context) => const ImcHomePage(),

    //details
    detailsHome: (context) => const DetailsHomePage(),
    detailsResult: (context) => const DetailsResultPage(),

    //crud

    //cep

    //crud api
    contactHome: (context) => const ContactListPage(),
    contactUpdate: (context) {
      final args = ModalRoute.of(context)?.settings.arguments as ContactArgsModel;

      return ContactUpdatePage(args: args);
    },

    contactRegister: (context) => const ContactRegisterPage(),
  };
}
