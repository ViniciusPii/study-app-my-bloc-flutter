import 'package:firebase_auth/firebase_auth.dart';
import 'package:superapp_my_bloc/src/core/infra/navigator/app_navigator.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/auth/auth_repository.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/user_auth/user_auth_repository.dart';

import '/src/core/infra/bloc.dart';

part 'crud_auth_home_state.dart';

class CrudAuthHomeBloc extends Bloc<CrudAuthHomeState> {
  CrudAuthHomeBloc({
    required AuthRepository authRepository,
    required UserAuthRepository userAuthRepository,
  })  : _authRepository = authRepository,
        _userAuthRepository = userAuthRepository,
        super(CrudAuthHomeInitial());

  final AuthRepository _authRepository;
  final UserAuthRepository _userAuthRepository;

  late final User? _user = _userAuthRepository.getUser();

  User get user => _user!;

  Future<void> signOut() => _authRepository.signOut();

  Future<void> changeName(String name) async {
    emit(CrudAuthHomeLoading());
    await _userAuthRepository.changeName(name);
    AppNavigator.to.pop();
    emit(CrudAuthHomeSuccess());
  }
}
