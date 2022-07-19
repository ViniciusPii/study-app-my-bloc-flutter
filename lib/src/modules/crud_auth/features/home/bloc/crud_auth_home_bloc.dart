import 'package:firebase_auth/firebase_auth.dart';
import 'package:superapp_my_bloc/src/core/infra/navigator/app_navigator.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/repositories/auth/auth_repository.dart';

import '/src/core/infra/bloc.dart';

part 'crud_auth_home_state.dart';

class CrudAuthHomeBloc extends Bloc<CrudAuthHomeState> {
  CrudAuthHomeBloc({
    required FirebaseAuth firebaseAuth,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        _firebaseAuth = firebaseAuth,
        super(CrudAuthHomeInitial());

  final FirebaseAuth _firebaseAuth;
  final AuthRepository _authRepository;

  late final User? _user = _firebaseAuth.currentUser;

  User get user => _user!;

  Future<void> signOut() => _authRepository.signOut();

  Future<void> changeName(String name) async {
    emit(CrudAuthHomeLoading());
    await _user!.updateDisplayName(name);
    AppNavigator.to.pop();
    emit(CrudAuthHomeSuccess());
  }
}
