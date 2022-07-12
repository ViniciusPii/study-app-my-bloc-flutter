import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_list/collaborator_list_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_register/collaborator_register_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_update/collaborator_update_page.dart';

class CrudFirebaseRoutes {
  CrudFirebaseRoutes._();

  static const String collaboratorsList = '/collaborators/list';
  static const String collaboratorsUpdate = '/collaborators/update';
  static const String collaboratorsRegister = '/collaborators/register';

  static final routes = {
    collaboratorsList: (context) => const CollaboratorListPage(),
    collaboratorsUpdate: (context) {
      final args = Utils.getArgs(context);

      return CollaboratorUpdatePage(args: args);
    },
    collaboratorsRegister: (context) => const CollaboratorRegisterPage(),
  };
}
