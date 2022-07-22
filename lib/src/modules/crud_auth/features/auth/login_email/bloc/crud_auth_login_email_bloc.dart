import 'package:superapp_my_bloc/src/modules/crud_auth/models/request/user_request_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/auth/auth_repository.dart';

import '/src/core/infra/bloc.dart';

part 'crud_auth_login_email_state.dart';

class CrudAuthLoginEmailBloc extends Bloc<CrudAuthLoginEmailState> {
  CrudAuthLoginEmailBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(CrudAuthLoginEmailInitial());

  final AuthRepository _authRepository;

  Future<void> signInWithEmailAndPassword(UserRequestModel user) async {
    emit(CrudAuthLoginEmailLoading());
    await _authRepository.signInWithEmailAndPassword(user);
  }
}
