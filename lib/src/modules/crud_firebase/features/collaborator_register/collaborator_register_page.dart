import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_register/bloc/collaborator_register_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';
import 'package:validatorless/validatorless.dart';

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
    final color = Utils.getColorArgs(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Salvar colaborador'),
      ),
      body: BaseViewComponent(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputComponent(
                  label: 'Nome',
                  controller: _nameEC,
                  validator: Validatorless.required('Obrigatório'),
                ),
                const SizedBox(
                  height: AppDimension.size_2,
                ),
                InputComponent(
                  label: 'Profissão',
                  controller: _jobEC,
                  validator: Validatorless.required('Obrigatório'),
                ),
                const SizedBox(
                  height: AppDimension.size_3,
                ),
                ButtonComponent(
                  color: color,
                  child: const Text('Cadastrar'),
                  func: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.addCollaborator(
                        CollaboratorModel(job: _jobEC.text, name: _nameEC.text),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
