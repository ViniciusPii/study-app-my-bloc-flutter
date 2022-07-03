import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/modules/home/home_page.dart';

class Routes {
  static String home = '/';

  final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
  };
}
