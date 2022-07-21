import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/auth/auth_repository.dart';

import '/src/core/infra/bloc.dart';

part 'crud_auth_create_account_state.dart';

class CrudAuthCreateAccountBloc extends Bloc<CrudAuthCreateAccountState> {
  CrudAuthCreateAccountBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(CrudAuthCreateAccountInitial());

  final AuthRepository _authRepository;

  Future<void> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    await _authRepository.createUserWithEmailAndPassword(name, email, password);
  }
}
