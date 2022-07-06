import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/details/features/details/details_result_page.dart';

class DetailsModule {
  DetailsModule._();

  static final module = AppModule(
    routeName: 'details/result',
    page: (_) => const DetailsResultPage(),
  );
}
