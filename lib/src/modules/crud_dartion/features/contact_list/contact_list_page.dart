import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/people_card_component.dart';
import 'package:superapp_my_bloc/src/core/components/snackbar_component.dart';
import 'package:superapp_my_bloc/src/core/components/three_bounce_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_consumer.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/colors/app_colors.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/features/contact_list/bloc/contact_list_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/models/contact_args_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/routes/crud_api_routes.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  late final ContactListBloc bloc;

  @override
  void initState() {
    bloc = get();
    bloc.getContacts();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        actions: [
          IconButton(
            onPressed: () => bloc.getContacts(),
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
        title: const Text('Home'),
      ),
      body: BaseViewComponent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            const SizedBox(
              height: AppDimension.size_5,
            ),
            _buildList(color),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(
            CrudApiRoutes.registerContact,
            arguments: color,
          );

          bloc.getContacts();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(Color color) {
    return BlocConsumer<ContactListBloc, ContactListState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is ContactListRemoveError) {
          SnackbarComponent.error(
            context,
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        final contacts = state.contacts;

        if (state is ContactListLoading || state is ContactListInitial) {
          return Expanded(
            child: ThreeBounceComponent(
              color: color,
            ),
          );
        }

        if (state is ContactListError) {
          return Expanded(
            child: Center(
              child: Text(
                state.message,
                style: AppFonts.titleLarge(
                  color: AppColors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (contacts.isEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                'Nenhum contato cadastrado',
                style: AppFonts.titleLarge(),
              ),
            ),
          );
        }

        return Expanded(
          child: ListView.builder(
            itemBuilder: ((context, index) {
              final contact = contacts[index];

              return PeopleCardComponent(
                title: contact.name,
                subtitle: contact.email,
                leftFunc: () async {
                  await Navigator.of(context).pushNamed(
                    CrudApiRoutes.updateContact,
                    arguments: ContactArgsModel(
                      color: color,
                      contact: contact,
                    ),
                  );

                  bloc.getContacts();
                },
                rightFunc: () => bloc.removeContact(contact),
              );
            }),
            itemCount: contacts.length,
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Text(
      'Lista de contatos',
      style: AppFonts.titleLarge(),
    );
  }
}
