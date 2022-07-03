import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_fonts.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/models/address_args_model.dart';

class AddressDetailsPage extends StatelessWidget {
  const AddressDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as AddressArgsModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: args.color,
        title: const Text('Endereço'),
      ),
      body: BaseViewComponent(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(),
            const SizedBox(
              height: AppDimension.size_3,
            ),
            _buildCard(args),
            const SizedBox(
              height: AppDimension.size_5,
            ),
            _buildButton(args, context)
          ],
        ),
      ),
    );
  }

  Widget _buildButton(AddressArgsModel args, BuildContext context) {
    return ButtonComponent(
      color: args.color,
      child: const Text('Pesquisar Novamente'),
      func: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Aqui está!',
          style: AppFonts.titleLarge(),
        ),
        const SizedBox(
          height: AppDimension.size_0,
        ),
        Text(
          'Esses são os detalhes do CEP pesquisado!',
          style: AppFonts.bodyMedium(
            color: AppExtension.textLightColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCard(AddressArgsModel args) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimension.size_1,
            horizontal: AppDimension.size_2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      args.address.street,
                      style: AppFonts.titleMedium(),
                    ),
                    Text(
                      args.address.neighborhood,
                      style: AppFonts.bodyMedium(
                        color: AppExtension.textLightColor,
                      ),
                    ),
                    const SizedBox(
                      height: AppDimension.size_2,
                    ),
                    Text(
                      '${args.address.locality} - ${args.address.uf}',
                      style: AppFonts.titleMedium(),
                    ),
                    Text(
                      args.address.cep,
                      style: AppFonts.bodyMedium(
                        color: AppExtension.textLightColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.home_outlined,
                size: AppDimension.size_4,
                color: AppExtension.textColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
