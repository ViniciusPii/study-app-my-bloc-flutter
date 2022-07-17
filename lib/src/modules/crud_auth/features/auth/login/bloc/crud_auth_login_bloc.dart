import 'package:superapp_my_bloc/src/core/exceptions/app_exception.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/auth/auth_repository.dart';

import '/src/core/infra/bloc.dart';

part 'crud_auth_login_state.dart';

class CrudAuthLoginBloc extends Bloc<CrudAuthLoginState> {
  CrudAuthLoginBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(CrudAuthLoginInitial());

  final AuthRepository _authRepository;

  Future<void> signInWithGoogle() async {
    emit(CrudAuthLoginLoading());
    try {
      await _authRepository.signInWithGoogle();
      emit(CrudAuthLoginSuccess());
    } on AppException catch (e) {
      emit(CrudAuthLoginError(message: e.message));
    }
  }
}
