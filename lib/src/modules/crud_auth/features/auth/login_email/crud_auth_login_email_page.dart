import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/theme/app_colors.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/core/utils/validators/app_validator.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/routes/crud_auth_routes.dart';

class CrudAuthLoginEmailPage extends StatelessWidget {
  const CrudAuthLoginEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Email e senha'),
        foregroundColor: Utils.getLuminance(color),
      ),
      body: BaseViewComponent(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  InputComponent(
                    label: 'Email',
                    validator: AppValidator.required('Obrigatório'),
                  ),
                  const SizedBox(
                    height: AppDimension.size_2,
                  ),
                  InputComponent(
                    label: 'Senha',
                    validator: AppValidator.required('Obrigatório'),
                  ),
                  const SizedBox(
                    height: AppDimension.size_3,
                  ),
                  ButtonComponent(
                    color: color,
                    child: const Text('Logar'),
                    func: () {},
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
    );
  }
}
