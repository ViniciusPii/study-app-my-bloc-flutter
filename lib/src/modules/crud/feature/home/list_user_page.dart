import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/three_bounce_component.dart';
import 'package:superapp_my_bloc/src/core/infra/components/bloc_builder.dart';
import 'package:superapp_my_bloc/src/core/infra/di/dependon.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud/feature/bloc/user_bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud/routes/crud_routes.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  late final UserBloc bloc;

  @override
  void initState() {
    bloc = get();
    bloc.getUsers();
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
        title: const Text('Home'),
      ),
      body: BaseViewComponent(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(
            height: AppDimension.size_5,
          ),
          _buildList(color),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(
                CrudRoutes.formUser,
                arguments: color,
              )
              .whenComplete(() => bloc.getUsers());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(Color color) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: bloc,
      builder: (context, state) {
        final users = state.users;

        if (state is UserLoading || state is UserInitial) {
          return Expanded(
            child: ThreeBounceComponent(
              color: color,
            ),
          );
        }

        if (users.isEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                'Nenhum usuário cadastrado',
                style: AppFonts.titleLarge(),
              ),
            ),
          );
        }

        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(
                title: Text(user.name),
                trailing: IconButton(
                  onPressed: () => bloc.removeUsers(user),
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                  ),
                ),
              );
            },
            itemCount: users.length,
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Text(
      'Lista de usuários',
      style: AppFonts.titleLarge(),
    );
  }
}
