import 'package:flutter/material.dart';

import 'package:superapp_my_bloc/src/modules/crud_firebase/models/collaborator_model.dart';

class CollaboratorArgsModel {
  CollaboratorArgsModel({
    required this.color,
    required this.collaborator,
  });

  final Color color;
  final CollaboratorModel collaborator;
}
