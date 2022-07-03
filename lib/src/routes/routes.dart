import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/modules/counter/counter_home_page.dart';
import 'package:superapp_my_bloc/src/modules/home/home_page.dart';
import 'package:superapp_my_bloc/src/modules/imc/imc_home_page.dart';

class Routes {
  static String home = '/';
  static String imcHome = '/imc';
  static String counterHome = '/counter';

  final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    imcHome: (context) => const ImcHomePage(),
    counterHome: (context) => const CounterHomePage(),
  };
}
