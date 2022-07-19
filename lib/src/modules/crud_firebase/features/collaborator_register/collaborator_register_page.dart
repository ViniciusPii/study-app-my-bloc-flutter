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
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_register/bloc/collaborator_register_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';

class CollaboratorRegisterPage extends StatefulWidget {
  const CollaboratorRegisterPage({Key? key}) : super(key: key);

  @override
  State<CollaboratorRegisterPage> createState() => _CollaboratorRegisterPageState();
}

class _CollaboratorRegisterPageState extends State<CollaboratorRegisterPage> {
  late final CollaboratorRegisterBloc bloc;

  final _formKey = GlobalKey<FormState>();
  final _jobEC = TextEditingController();
  final _nameEC = TextEditingController();

  @override
  void initState() {
    bloc = get();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    _jobEC.dispose();
    _nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Salvar colaborador'),
      ),
      body: BaseViewComponent(
        child: Center(
          child: _buildForm(color),
        ),
      ),
    );
  }

  Widget _buildForm(color) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputComponent(
            label: 'Nome',
            controller: _nameEC,
            inputFormatters: [AppMasks.onlyLetters],
            validator: AppValidator.required('Obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_2,
          ),
          InputComponent(
            label: 'Profissão',
            controller: _jobEC,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _addCollaborator(),
            validator: AppValidator.required('Obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_3,
          ),
          BlocConsumer<CollaboratorRegisterBloc, CollaboratorRegisterState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is CollaboratorRegisterSuccess) {
                Navigator.pop(context);
              }

              if (state is CollaboratorRegisterError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );

                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return LoaderComponent(
                color: color,
                loading: state is CollaboratorRegisterLoading,
                child: ButtonComponent(
                  color: color,
                  child: const Text('Cadastrar'),
                  func: () => _addCollaborator(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void _addCollaborator() {
    if (_formKey.currentState!.validate()) {
      bloc.addCollaborator(
        CollaboratorModel(
          job: _jobEC.text,
          name: _nameEC.text,
        ),
      );
    }
  }
}
