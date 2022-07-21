import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/page_widget.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/core/utils/validators/app_validator.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/features/auth/create_account/bloc/crud_auth_create_account_bloc.dart';

class CrudAuthCreateAccountPage extends PageWidget<CrudAuthCreateAccountBloc> {
  CrudAuthCreateAccountPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
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
        title: const Text('Criar conta'),
        foregroundColor: Utils.getLuminance(color),
      ),
      body: BaseViewComponent(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputComponent(
                label: 'Nome',
                controller: _nameEC,
                validator: AppValidator.required('Obrigatório'),
              ),
              const SizedBox(
                height: AppDimension.size_2,
              ),
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
                controller: _passwordEC,
                validator: AppValidator.required('Obrigatório'),
              ),
              const SizedBox(
                height: AppDimension.size_3,
              ),
              ButtonComponent(
                color: color,
                func: () {
                  if (_formKey.currentState!.validate()) {
                    bloc.createUserWithEmailAndPassword(
                      _nameEC.text,
                      _emailEC.text,
                      _passwordEC.text,
                    );
                  }
                },
                child: const Text('Cadastrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
