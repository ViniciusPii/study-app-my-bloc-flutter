import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/components/loader_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_consumer.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/infra/utils/validators/app_validator.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/app_masks.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/details/features/home/bloc/result_bloc.dart';
import 'package:superapp_my_bloc/src/modules/details/models/details_args_model.dart';
import 'package:superapp_my_bloc/src/modules/details/routes/details_routes.dart';

class DetailsHomePage extends StatefulWidget {
  const DetailsHomePage({Key? key}) : super(key: key);

  @override
  State<DetailsHomePage> createState() => _DetailsHomePageState();
}

class _DetailsHomePageState extends State<DetailsHomePage> {
  late final ResultBloc bloc;

  final _formKey = GlobalKey<FormState>();
  final _firstNumberEC = TextEditingController();
  final _secondNumberEC = TextEditingController();

  @override
  void initState() {
    bloc = get();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    _firstNumberEC.dispose();
    _secondNumberEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Home'),
      ),
      body: BaseViewComponent(
        child: Column(
          children: [
            _buildTitle(),
            const SizedBox(
              height: AppDimension.size_5,
            ),
            _buildForm(color),
          ],
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
            label: 'Primeiro',
            controller: _firstNumberEC,
            masks: [AppMasks.onlyNumbers],
            keyboardType: TextInputType.number,
            validator: AppValidator.required('Obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_2,
          ),
          InputComponent(
            label: 'Segundo',
            controller: _secondNumberEC,
            masks: [AppMasks.onlyNumbers],
            keyboardType: TextInputType.number,
            validator: AppValidator.required('Obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_3,
          ),
          BlocConsumer<ResultBloc, ResultState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is ResultSuccess) {
                Navigator.of(context).pushNamed(
                  DetailsRoutes.detailsResult,
                  arguments: DetailsArgsModel(result: state.result, color: color),
                );
              }
            },
            builder: (context, state) {
              return LoaderComponent(
                color: color,
                loading: state is ResultLoading,
                child: ButtonComponent(
                  color: color,
                  child: const Text('Calcular'),
                  func: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.calculate(
                        AppMasks.onlyNumbers.parse(_firstNumberEC.text).toInt(),
                        AppMasks.onlyNumbers.parse(_secondNumberEC.text).toInt(),
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
          'Calculadora de +',
          style: AppFonts.titleLarge(),
        ),
        const SizedBox(
          height: AppDimension.size_0,
        ),
        Text(
          'Calculadora simples a fim de ouvir uma mudança de estado e mudar para uma página de detalhes',
          style: AppFonts.bodyMedium(
            color: AppExtension.textLightColor,
          ),
        ),
      ],
    );
  }
}
