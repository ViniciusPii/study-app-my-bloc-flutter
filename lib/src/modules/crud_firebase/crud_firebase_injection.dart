import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/injection.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_list/bloc/collaborator_list_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_register/bloc/collaborator_register_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_update/bloc/collaborator_update_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/repositories/collaborator/collaborator_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/repositories/collaborator/collaborator_repository_impl.dart';

class CrudFirebaseInjection {
  CrudFirebaseInjection._();

  static injection() {
    //repositories
    di.registerLazySingleton<CollaboratorRepository>(
      () => CollaboratorRepositoryImpl(firestore: get()),
    );

    //controllers
    di.registerFactory(() => CollaboratorListBloc(collaboratorRepository: get()));
    di.registerFactory(() => CollaboratorUpdateBloc(collaboratorRepository: get()));
    di.registerFactory(() => CollaboratorRegisterBloc(collaboratorRepository: get()));
  }
}
