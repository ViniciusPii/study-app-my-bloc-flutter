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
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/features/contact_register/bloc/contact_register_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/models/contact_model.dart';

class ContactRegisterPage extends StatefulWidget {
  const ContactRegisterPage({Key? key}) : super(key: key);

  @override
  State<ContactRegisterPage> createState() => _ContactRegisterPageState();
}

class _ContactRegisterPageState extends State<ContactRegisterPage> {
  late final ContactRegisterBloc bloc;

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();

  @override
  void initState() {
    bloc = get();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    _nameEC.dispose();
    _emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Adicione seu contato'),
      ),
      body: Center(
        child: _buildForm(color),
      ),
    );
  }

  Widget _buildForm(Color color) {
    return Form(
      key: _formKey,
      child: BaseViewComponent(
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
            label: 'Email',
            controller: _emailEC,
            validator: AppValidator.multiple([
              AppValidator.required('Obrigatório'),
              AppValidator.email('Formato inválido'),
            ]),
          ),
          const SizedBox(
            height: AppDimension.size_3,
          ),
          BlocConsumer<ContactRegisterBloc, ContactRegisterState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is ContactRegisterSuccess) {
                Navigator.pop(context);
              }

              if (state is ContactRegisterError) {
                SnackbarComponent.error(
                  context,
                  message: state.message,
                );
              }
            },
            builder: (context, state) {
              return LoaderComponent(
                color: color,
                loading: state is ContactRegisterLoading,
                child: ButtonComponent(
                  color: color,
                  child: const Text('Cadastrar'),
                  func: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.addContact(
                        ContactModel(
                          name: _nameEC.text,
                          email: _emailEC.text,
                          timestamp: DateTime.now(),
                        ),
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
