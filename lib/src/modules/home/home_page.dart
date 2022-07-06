import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/card_component.dart';
import 'package:superapp_my_bloc/src/core/components/status_bar_component.dart';
import 'package:superapp_my_bloc/src/core/theme/app_colors.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_fonts.dart';
import 'package:superapp_my_bloc/src/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarComponent(
      child: Scaffold(
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
      ),
    );
  }

  _goToPage(BuildContext context, Color color, String route) =>
      Navigator.of(context).pushNamed(route, arguments: color);

  Widget _buildCards(BuildContext context) {
    return Column(
      children: [
        CardComponent(
          title: 'Contador',
          color: AppColors.blue800,
          func: () => _goToPage(
            context,
            AppColors.blue800,
            '/counter',
          ),
        ),
        CardComponent(
          title: 'IMC',
          color: AppColors.purple700,
          func: () => _goToPage(
            context,
            AppColors.purple700,
            Routes.imcHome,
          ),
        ),
        CardComponent(
          title: 'Detalhes',
          color: AppColors.purpleRed700,
          func: () => _goToPage(
            context,
            AppColors.purpleRed700,
            Routes.detailsHome,
          ),
        ),
        CardComponent(
          title: 'CRUD sem BD',
          color: AppColors.red700,
          func: () => _goToPage(
            context,
            AppColors.red700,
            'crud/list',
          ),
        ),
        CardComponent(
          title: 'CEP por API',
          color: AppColors.red600,
          func: () => _goToPage(
            context,
            AppColors.red600,
            'cep',
          ),
        ),
        CardComponent(
          title: 'CRUD com API',
          color: AppColors.orange,
          func: () => _goToPage(
            context,
            AppColors.orange,
            Routes.contactHome,
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
