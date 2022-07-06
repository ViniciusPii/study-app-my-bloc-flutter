import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/injection.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_list/bloc/contact_list_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_register/bloc/contact_register_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_update/bloc/contact_update_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/repositories/contact/contact_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/repositories/contact/contact_repository_impl.dart';

class CrudApiInjection {
  CrudApiInjection._();

  static injection() {
    //repositories
    di.registerLazySingleton<ContactRepository>(() => ContactRepositoryImpl(dio: get()));

    //controllers
    di.registerFactory(() => ContactListBloc(contactRepository: get()));
    di.registerFactory(() => ContactUpdateBloc(contactRepository: get()));
    di.registerFactory(() => ContactRegisterBloc(contactRepository: get()));
  }
}
