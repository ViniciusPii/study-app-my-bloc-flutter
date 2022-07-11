import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_list/collaborator_list_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_register/collaborator_register_page.dart';

class CrudFirebaseRoutes {
  CrudFirebaseRoutes._();

  static const String collaboratorsList = '/collaborators/list';
  static const String collaboratorsRegister = '/collaborators/register';

  static final routes = {
    collaboratorsList: (context) => const CollaboratorListPage(),
    collaboratorsRegister: (context) => const CollaboratorRegisterPage(),
  };
}
