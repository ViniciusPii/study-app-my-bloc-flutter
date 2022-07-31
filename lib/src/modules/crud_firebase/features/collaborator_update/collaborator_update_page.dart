import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/components/loader_component.dart';
import 'package:superapp_my_bloc/src/core/components/snackbar_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_consumer.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/infra/utils/validators/app_validator.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/utils/app_masks.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_update/bloc/collaborator_update_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_args_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';

class CollaboratorUpdatePage extends StatefulWidget {
  const CollaboratorUpdatePage({
    Key? key,
    required this.args,
  }) : super(key: key);

  final CollaboratorArgsModel args;

  @override
  State<CollaboratorUpdatePage> createState() => _CollaboratorUpdatePageState();
}

class _CollaboratorUpdatePageState extends State<CollaboratorUpdatePage> {
  late final CollaboratorUpdateBloc bloc;

  late final color = widget.args.color;
  late final collaborator = widget.args.collaborator;

  final _formKey = GlobalKey<FormState>();
  final _jobEC = TextEditingController();
  final _nameEC = TextEditingController();

  @override
  void initState() {
    bloc = get();
    _jobEC.text = collaborator.job;
    _nameEC.text = collaborator.name;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Editando ${collaborator.name}'),
      ),
      body: BaseViewComponent(
        child: Center(
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputComponent(
            label: 'Nome',
            controller: _nameEC,
            masks: [AppMasks.onlyLetters],
            validator: AppValidator.required('Obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_2,
          ),
          InputComponent(
            label: 'Profissão',
            controller: _jobEC,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _updateCollaborator(),
            validator: AppValidator.required('Obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_3,
          ),
          BlocConsumer<CollaboratorUpdateBloc, CollaboratorUpdateState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is CollaboratorUpdateSuccess) {
                Navigator.pop(context);
              }

              if (state is CollaboratorUpdateError) {
                SnackbarComponent.info(
                  this.context,
                  message: state.message,
                );

                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return LoaderComponent(
                color: color,
                loading: state is CollaboratorUpdateLoading,
                child: ButtonComponent(
                  color: color,
                  child: const Text('Editar'),
                  func: () => _updateCollaborator(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void _updateCollaborator() {
    if (_formKey.currentState!.validate()) {
      bloc.updateCollaborator(
        CollaboratorModel(
          id: collaborator.id,
          job: _jobEC.text,
          name: _nameEC.text,
        ),
      );
    }
  }
}
