import 'package:superapp_my_bloc/src/modules/crud_auth/models/request/user_request_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/auth/auth_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/user_auth/user_auth_repository.dart';

import '/src/core/infra/bloc.dart';

part 'crud_auth_create_account_state.dart';

class CrudAuthCreateAccountBloc extends Bloc<CrudAuthCreateAccountState> {
  CrudAuthCreateAccountBloc({
    required AuthRepository authRepository,
    required UserAuthRepository userAuthRepository,
  })  : _authRepository = authRepository,
        _userAuthRepository = userAuthRepository,
        super(CrudAuthCreateAccountInitial());

  final AuthRepository _authRepository;
  final UserAuthRepository _userAuthRepository;

  Future<void> createUserWithEmailAndPassword(UserRequestModel user) async {
    emit(CrudAuthCreateAccountLoading());
    await _authRepository.createUserWithEmailAndPassword(user);
    await _userAuthRepository.changeName(user.name!);
  }
}
