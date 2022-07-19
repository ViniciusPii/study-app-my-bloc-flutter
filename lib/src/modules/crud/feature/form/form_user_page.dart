import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/components/loader_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_consumer.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/utils/masks/app_masks.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/core/utils/validators/app_validator.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/bloc/user_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud/models/user_model.dart';

class FormUserPage extends StatefulWidget {
  const FormUserPage({Key? key}) : super(key: key);

  @override
  State<FormUserPage> createState() => _FormUserPageState();
}

class _FormUserPageState extends State<FormUserPage> {
  late final UserBloc bloc;

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();

  @override
  void initState() {
    bloc = get();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    _nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Salvar Usuário'),
      ),
      body: Center(
        child: BaseViewComponent(
          child: _buildForm(color),
        ),
      ),
    );
  }

  Widget _buildForm(Color color) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputComponent(
            label: 'Nome',
            controller: _nameEC,
            validator: AppValidator.required('Obrigatório'),
            inputFormatters: [AppMasks.onlyLetters],
          ),
          const SizedBox(
            height: AppDimension.size_3,
          ),
          BlocConsumer<UserBloc, UserState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is UserSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return LoaderComponent(
                color: color,
                loading: state is UserLoading,
                child: ButtonComponent(
                  color: color,
                  child: const Text('Cadastrar'),
                  func: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.addUsers(
                        UserModel(name: _nameEC.text),
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
}
