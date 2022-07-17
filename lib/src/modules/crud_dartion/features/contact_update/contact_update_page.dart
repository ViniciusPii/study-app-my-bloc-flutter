import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/button_component.dart';
import 'package:superapp_my_bloc/src/core/components/input_component.dart';
import 'package:superapp_my_bloc/src/core/components/loader_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_consumer.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/features/contact_update/bloc/contact_update_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/models/contact_args_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/models/contact_model.dart';
import 'package:validatorless/validatorless.dart';

class ContactUpdatePage extends StatefulWidget {
  const ContactUpdatePage({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ContactArgsModel args;

  @override
  State<ContactUpdatePage> createState() => _ContactUpdatePageState();
}

class _ContactUpdatePageState extends State<ContactUpdatePage> {
  late final ContactUpdateBloc bloc;

  late final color = widget.args.color;
  late final contact = widget.args.contact;

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameEC;
  late final TextEditingController _emailEC;

  @override
  void initState() {
    bloc = get();
    _nameEC = TextEditingController(text: contact.name);
    _emailEC = TextEditingController(text: contact.email);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Editando ${contact.name}'),
      ),
      body: BaseViewComponent(
        child: Center(
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
            validator: Validatorless.required('Obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_2,
          ),
          InputComponent(
            label: 'Email',
            controller: _emailEC,
            validator: Validatorless.multiple([
              Validatorless.required('Obrigatório'),
              Validatorless.email('Formato inválido'),
            ]),
          ),
          const SizedBox(
            height: AppDimension.size_3,
          ),
          BlocConsumer<ContactUpdateBloc, ContactUpdateState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is ContactUpdateSuccess) {
                Navigator.pop(context);
              }

              if (state is ContactUpdateError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message,
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              return LoaderComponent(
                color: color,
                loading: state is ContactUpdateLoading,
                child: ButtonComponent(
                  color: color,
                  child: const Text('Cadastrar'),
                  func: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.updateContact(
                        ContactModel(
                          id: contact.id,
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
