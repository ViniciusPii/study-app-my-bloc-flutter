import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/components/loader_component.dart';
import 'package:superapp_my_bloc/src/core/components/snackbar_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_consumer.dart';
import 'package:superapp_my_bloc/src/core/infra/components/page_widget.dart';
import 'package:superapp_my_bloc/src/core/infra/utils/validators/app_validator.dart';
import 'package:superapp_my_bloc/src/core/theme/app_colors.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/auth/login_email/bloc/crud_auth_login_email_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/models/request/user_request_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/routes/crud_auth_routes.dart';

class CrudAuthLoginEmailPage extends PageWidget<CrudAuthLoginEmailBloc> {
  CrudAuthLoginEmailPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Email e senha'),
        foregroundColor: Utils.getLuminance(color),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BaseViewComponent(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputComponent(
                        label: 'Email',
                        controller: _emailEC,
                        validator: AppValidator.required('Obrigatório'),
                      ),
                      const SizedBox(
                        height: AppDimension.size_2,
                      ),
                      InputComponent(
                        label: 'Senha',
                        obscured: true,
                        controller: _passwordEC,
                        validator: AppValidator.required('Obrigatório'),
                      ),
                      const SizedBox(
                        height: AppDimension.size_3,
                      ),
                      BlocConsumer<CrudAuthLoginEmailBloc, CrudAuthLoginEmailState>(
                        bloc: bloc,
                        listener: (context, state) {
                          if (state is CrudAuthLoginEmailError) {
                            SnackbarComponent.error(
                              context,
                              message: state.message,
                            );
                          }
                        },
                        builder: (context, state) {
                          return LoaderComponent(
                            color: color,
                            loading: state is CrudAuthLoginEmailLoading,
                            child: ButtonComponent(
                              color: color,
                              child: const Text('Logar'),
                              func: () {
                                if (_formKey.currentState!.validate()) {
                                  bloc.signInWithEmailAndPassword(
                                    UserRequestModel(
                                      email: _emailEC.text,
                                      password: _passwordEC.text,
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppDimension.size_5,
                ),
                const Divider(),
                const SizedBox(
                  height: AppDimension.size_3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não tem uma conta?'),
                    TextButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        CrudAuthRoutes.crudAuthCreateAccount,
                        arguments: color,
                      ),
                      style: TextButton.styleFrom(
                        primary: AppColors.blue,
                      ),
                      child: const Text('Criar já!'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
