import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/base_view_component.dart';
import 'package:superapp_my_bloc/src/core/components/people_card_component.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';
import 'package:superapp_my_bloc/src/modules/crud_firebase/routes/crud_firebase_routes.dart';

class CollaboratorListPage extends StatefulWidget {
  const CollaboratorListPage({Key? key}) : super(key: key);

  @override
  State<CollaboratorListPage> createState() => _CollaboratorListPageState();
}

class _CollaboratorListPageState extends State<CollaboratorListPage> {
  @override
  Widget build(BuildContext context) {
    final color = Utils.getColorArgs(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Lista de funcionários'),
      ),
      body: BaseViewComponent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            const SizedBox(
              height: AppDimension.size_5,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PeopleCardComponent(
                  title: 'Teste',
                  subtitle: 'Teste',
                  leftFunc: () {},
                  rightFunc: () {},
                );
              },
              itemCount: 5,
            ),
          ],
        ),
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

  Widget _buildTitle() {
    return Text(
      'Lista de funcionários',
      style: AppFonts.titleLarge(),
    );
  }
}
