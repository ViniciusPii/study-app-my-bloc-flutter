part of 'crud_auth_splash_bloc.dart';

abstract class CrudAuthSplashState {
  CrudAuthSplashState();
}

class CrudAuthSplashInitial extends CrudAuthSplashState {
  CrudAuthSplashInitial() : super();
}

class CrudAuthSplashLoading extends CrudAuthSplashState {
  CrudAuthSplashLoading() : super();
}

class CrudAuthSplashSuccess extends CrudAuthSplashState {
  CrudAuthSplashSuccess() : super();
}

class CrudAuthSplashError extends CrudAuthSplashState {
  CrudAuthSplashError({
    required this.message,
  }) : super();

  final String message;
}
