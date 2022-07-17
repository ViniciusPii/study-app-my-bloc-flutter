import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/models/contact_model.dart';

class ContactArgsModel {
  ContactArgsModel({
    required this.color,
    required this.contact,
  });

  final Color color;
  final ContactModel contact;
}
