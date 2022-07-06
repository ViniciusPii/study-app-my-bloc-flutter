import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/module/app_module.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/features/contact_update/contact_update_page.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/models/contact_args_model.dart';

class ContactUpdateRoute {
  ContactUpdateRoute._();

  static final route = AppRoute(
    name: 'contact/update',
    page: (context) {
      final args = ModalRoute.of(context)?.settings.arguments as ContactArgsModel;
      return ContactUpdatePage(args: args);
    },
  );
}
