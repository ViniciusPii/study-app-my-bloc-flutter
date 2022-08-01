import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/people_card_component.dart';
import 'package:superapp_my_bloc/src/core/components/three_bounce_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_builder.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/features/collaborator_list/bloc/collaborator_list_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_args_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/routes/crud_firebase_routes.dart';

class CollaboratorListPage extends StatefulWidget {
  const CollaboratorListPage({Key? key}) : super(key: key);

  @override
  State<CollaboratorListPage> createState() => _CollaboratorListPageState();
}

class _CollaboratorListPageState extends State<CollaboratorListPage> {
  late final CollaboratorListBloc bloc;

  @override
  void initState() {
    bloc = get();
    bloc.getCollaborators();
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
        title: const Text('Lista de funcionários'),
      ),
      body: BaseViewComponent(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(
            height: AppDimension.size_5,
          ),
          _buildListView(color),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          CrudFirebaseRoutes.collaboratorsRegister,
          arguments: color,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView(Color color) {
    return BlocBuilder<CollaboratorListBloc, CollaboratorListState>(
      bloc: bloc,
      builder: (context, state) {
        final collaborators = state.collaborators;

        if (state is CollaboratorListLoading || state is CollaboratorListInitial) {
          return Expanded(
            child: ThreeBounceComponent(
              color: color,
            ),
          );
        }

        if (collaborators.isEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                'Nenhum colaborador cadastrado',
                style: AppFonts.titleLarge(),
              ),
            ),
          );
        }

        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final collaborator = collaborators[index];

              return PeopleCardComponent(
                title: collaborator.name,
                subtitle: collaborator.job,
                leftFunc: () => Navigator.of(context).pushNamed(
                  CrudFirebaseRoutes.collaboratorsUpdate,
                  arguments: CollaboratorArgsModel(
                    color: color,
                    collaborator: collaborator,
                  ),
                ),
                rightFunc: () => bloc.removeCollaborator(collaborator),
              );
            },
            itemCount: state.collaborators.length,
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Lista de funcionários',
          style: AppFonts.titleLarge(),
        ),
        IconButton(
          onPressed: () => bloc.removeAllCollaborator(),
          icon: const Icon(
            Icons.delete_forever,
          ),
        ),
      ],
    );
  }
}
