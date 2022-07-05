import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/bloc/components/bloc_consumer.dart';
import 'package:superapp_my_bloc/src/core/bloc/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/people_card_component.dart';
import 'package:superapp_my_bloc/src/core/components/three_bounce_component.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_list/bloc/contact_list_bloc.dart';

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
  Widget build(BuildContext context) {
    final color = Utils.getColorArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
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
    );
  }

  Widget _buildList(Color color) {
    return BlocConsumer<ContactListBloc, ContactListState>(
      bloc: bloc,
      builder: (context, state) {
        final contacts = state.contacts;

        if (state is ContactListLoading || state is ContactListInitial) {
          return Expanded(
            child: ThreeBounceComponent(
              color: color,
            ),
          );
        }

        if (state is ContactListLoading || state is ContactListInitial) {
          return Expanded(
            child: Text(
              'Nenhum contato cadastrado',
              style: AppFonts.titleLarge(),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            final contact = contacts[index];

            return PeopleCardComponent(
              title: contact.name,
              subtitle: contact.email,
              leftFunc: () {},
              rightFunc: () {},
            );
          }),
          itemCount: contacts.length,
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
