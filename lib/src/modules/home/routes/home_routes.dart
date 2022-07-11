import 'package:superapp_my_bloc/src/modules/home/features/home_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static const String home = '/';

  static final routes = {
    home: (context) => const HomePage(),
  };
}
