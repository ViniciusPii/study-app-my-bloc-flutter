import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/features/home/cep_home_page.dart';
import 'package:superapp_my_bloc/src/modules/counter/feature/counter_home_page.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/form/form_user_page.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/home/list_user_page.dart';
import 'package:superapp_my_bloc/src/modules/details/features/details/details_result_page.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/details_home_page.dart';
import 'package:superapp_my_bloc/src/modules/home/home_page.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/imc_home_page.dart';

class Routes {
  static String home = '/';

  static String counterHome = '/counter';

  static String imcHome = '/imc';

  static String detailsHome = '/details';
  static String detailsResult = '/details/result';

  static String listUser = '/list';
  static String formUser = '/form';

  static String cepHome = '/cep';

  final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),

    //counter
    counterHome: (context) => const CounterHomePage(),

    //imc
    imcHome: (context) => const ImcHomePage(),

    //details
    detailsHome: (context) => const DetailsHomePage(),
    detailsResult: (context) => const DetailsResultPage(),

    //crud
    listUser: (context) => const ListUserPage(),
    formUser: (context) => const FormUserPage(),

    //cep
    cepHome: (context) => const CepHomePage(),
  };
}
