import 'package:superapp_my_bloc/src/core/infra/bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/services/crud_auth_service.dart';

part 'crud_auth_splash_state.dart';

class CrudAuthSplashBloc extends Bloc<CrudAuthSplashState> {
  CrudAuthSplashBloc({
    required CrudAuthService crudAuthService,
  })  : _crudAuthService = crudAuthService,
        super(CrudAuthSplashInitial());

  final CrudAuthService _crudAuthService;

  void authInit() => _crudAuthService.authInit();
}
