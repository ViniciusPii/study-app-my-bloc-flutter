import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/components/loader_component.dart';
import 'package:superapp_my_bloc/src/core/components/snackbar_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_builder.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_consumer.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/infra/utils/validators/app_validator.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/app_masks.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/imc/features/bloc/imc_bloc.dart';

class ImcHomePage extends StatefulWidget {
  const ImcHomePage({Key? key}) : super(key: key);

  @override
  State<ImcHomePage> createState() => _ImcHomePageState();
}

class _ImcHomePageState extends State<ImcHomePage> {
  late final ImcBloc bloc;

  final _formKey = GlobalKey<FormState>();
  final _heightEC = TextEditingController();
  final _weightEC = TextEditingController();

  @override
  void initState() {
    bloc = get();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    _heightEC.dispose();
    _weightEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Calculadora de IMC'),
      ),
      body: SingleChildScrollView(
        child: BaseViewComponent(
          children: [
            _buildTitle(),
            const SizedBox(
              height: AppDimension.size_5,
            ),
            _buildForm(color),
            const SizedBox(
              height: AppDimension.size_3,
            ),
            _buildResult(color)
          ],
        ),
      ),
    );
  }

  Widget _buildResult(Color color) {
    return BlocConsumer<ImcBloc, ImcState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is ImcError) {
          SnackbarComponent.error(context, message: state.message);
        }
      },
      builder: (context, state) {
        return Visibility(
          visible: state is ImcSuccess,
          child: Column(
            children: [
              Text(
                'Seu imc é ${state.imc.toStringAsFixed(2)}',
                style: AppFonts.bodyLarge(),
              ),
              const SizedBox(
                height: AppDimension.size_1,
              ),
              Text(
                state.result,
                style: AppFonts.titleLarge(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildForm(Color color) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputComponent(
            suffix: 'm',
            label: 'Altura',
            controller: _heightEC,
            masks: [AppMasks.twoDecimal],
            keyboardType: TextInputType.number,
            validator: AppValidator.required('Campo obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_2,
          ),
          InputComponent(
            suffix: 'Kg',
            label: 'Peso',
            controller: _weightEC,
            masks: [AppMasks.twoDecimal],
            keyboardType: TextInputType.number,
            validator: AppValidator.required('Campo obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_4,
          ),
          BlocBuilder<ImcBloc, ImcState>(
            bloc: bloc,
            builder: (context, state) {
              return LoaderComponent(
                color: color,
                loading: state is ImcLoading,
                child: ButtonComponent(
                  color: color,
                  child: const Text('Calcular'),
                  func: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.imcCalculate(
                        AppMasks.twoDecimal.parse(_heightEC.text).toDouble(),
                        AppMasks.twoDecimal.parse(_weightEC.text).toDouble(),
                      );

                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Calculadora de IMC',
          style: AppFonts.titleLarge(),
        ),
        const SizedBox(
          height: AppDimension.size_0,
        ),
        Text(
          'Calcule seu IMC e descubra sua composição corporal!',
          style: AppFonts.bodyLarge(
            color: AppExtension.textLightColor,
          ),
        ),
      ],
    );
  }
}
