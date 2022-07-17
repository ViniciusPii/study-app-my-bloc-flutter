import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/infra/components/page_widget.dart';
import 'package:superapp_my_bloc/src/core/theme/app_fonts.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/splash/bloc/crud_auth_splash_bloc.dart';

class CrudAuthSplashPage extends PageWidget<CrudAuthSplashBloc> {
  CrudAuthSplashPage({Key? key}) : super(key: key);

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) => bloc.init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Seja bem-vindo',
          style: AppFonts.titleLarge(),
        ),
      ),
    );
  }
}
