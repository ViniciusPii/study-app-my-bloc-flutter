import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/components/loader_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_consumer.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/masks/app_masks.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/features/home/bloc/address_bloc.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/models/address_args_model.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/routes/cep_routes.dart';
import 'package:validatorless/validatorless.dart';

class CepHomePage extends StatefulWidget {
  const CepHomePage({Key? key}) : super(key: key);

  @override
  State<CepHomePage> createState() => _CepHomePageState();
}

class _CepHomePageState extends State<CepHomePage> {
  late final AddressBloc bloc;

  final _formKey = GlobalKey<FormState>();
  final _cepEC = TextEditingController();

  @override
  void initState() {
    bloc = get();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    _cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('CEP'),
      ),
      body: Center(
        child: BaseViewComponent(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(),
              const SizedBox(
                height: AppDimension.size_3,
              ),
              _buildForm(color),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(Color color) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputComponent(
            label: 'Cep',
            controller: _cepEC,
            inputFormatters: [AppMasks.cepMask],
            validator: Validatorless.required('Obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_3,
          ),
          BlocConsumer<AddressBloc, AddressState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is AddressSuccess) {
                Navigator.of(context)
                    .pushNamed(
                      CepRoutes.cepResult,
                      arguments: AddressArgsModel(
                        color: color,
                        address: state.address,
                      ),
                    )
                    .whenComplete(() => _cepEC.clear());
              }

              if (state is AddressError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              return LoaderComponent(
                color: color,
                loading: state is AddressLoading,
                child: ButtonComponent(
                  color: color,
                  child: const Text('Buscar'),
                  func: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.getAddress(
                        int.parse(AppMasks.unMaskNumber(_cepEC.text)),
                      );
                    }
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vamos começar!',
          style: AppFonts.titleLarge(),
        ),
        const SizedBox(
          height: AppDimension.size_0,
        ),
        Text(
          'Digite o cep desejado para buscar as informações de endereço!',
          style: AppFonts.bodyLarge(
            color: AppExtension.textLightColor,
          ),
        ),
      ],
    );
  }
}
