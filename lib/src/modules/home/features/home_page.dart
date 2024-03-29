import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/card_component.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/colors/app_colors.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/routes/cep_routes.dart';
import 'package:superapp_my_bloc/src/modules/counter/routes/counter_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud/routes/crud_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud_auth/routes/crud_auth_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion//routes/crud_api_routes.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/routes/crud_firebase_routes.dart';
import 'package:superapp_my_bloc/src/modules/details/routes/details_routes.dart';
import 'package:superapp_my_bloc/src/modules/imc/routes/imc_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimension.size_4,
            horizontal: AppDimension.size_3,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTitle(),
                const SizedBox(
                  height: AppDimension.size_3,
                ),
                _buildCards(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _goToPage(BuildContext context, Color color, String route) =>
      Navigator.of(context).pushNamed(route, arguments: color);

  _goToPageReplace(BuildContext context, Color color, String route) =>
      Navigator.of(context).pushReplacementNamed(route, arguments: color);

  Widget _buildCards(BuildContext context) {
    return Column(
      children: [
        CardComponent(
          title: 'CEP por API',
          color: AppColors.red600,
          func: () => _goToPage(
            context,
            AppColors.red600,
            CepRoutes.cepHome,
          ),
        ),
        CardComponent(
          title: 'Contador',
          color: AppColors.blue800,
          func: () => _goToPage(
            context,
            AppColors.blue800,
            CounterRoutes.counterHome,
          ),
        ),
        CardComponent(
          title: 'CRUD sem BD',
          color: AppColors.red700,
          func: () => _goToPage(
            context,
            AppColors.red700,
            CrudRoutes.listUser,
          ),
        ),
        CardComponent(
          title: 'CRUD com Auth',
          color: AppColors.chartreuse,
          func: () => _goToPageReplace(
            context,
            AppColors.chartreuse,
            CrudAuthRoutes.crudAuthSplash,
          ),
        ),
        CardComponent(
          title: 'CRUD com Dartion',
          color: AppColors.orange,
          func: () => _goToPage(
            context,
            AppColors.orange,
            CrudApiRoutes.listContact,
          ),
        ),
        CardComponent(
          title: 'CRUD com Firebase',
          color: AppColors.green700,
          func: () => _goToPage(
            context,
            AppColors.green700,
            CrudFirebaseRoutes.collaboratorsList,
          ),
        ),
        CardComponent(
          title: 'Detalhes',
          color: AppColors.purpleRed700,
          func: () => _goToPage(
            context,
            AppColors.purpleRed700,
            DetailsRoutes.detailsHome,
          ),
        ),
        CardComponent(
          title: 'IMC',
          color: AppColors.purple700,
          func: () => _goToPage(
            context,
            AppColors.purple700,
            ImcRoutes.imcHome,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SuperApp de Estudos',
          style: AppFonts.titleLarge(),
        ),
        const SizedBox(
          height: AppDimension.size_0,
        ),
        Text(
          'SuperApp que visa treino de vários apps e situações do dia-a-dia.',
          style: AppFonts.bodyLarge(
            color: AppExtension.textLightColor,
          ),
        ),
      ],
    );
  }
}
