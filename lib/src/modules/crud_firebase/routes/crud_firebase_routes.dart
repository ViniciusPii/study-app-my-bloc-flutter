import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_list/collaborator_list_page.dart';

class CrudFirebaseRoutes {
  CrudFirebaseRoutes._();

  static const String collaboratorsList = '/collaborators/list';

  static final routes = {
    collaboratorsList: (context) => const CollaboratorListPage(),
  };
}
