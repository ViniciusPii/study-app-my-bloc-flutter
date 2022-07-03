import 'package:flutter/material.dart';

import 'package:superapp_my_bloc/src/modules/cep_api/models/address_model.dart';

class AddressArgsModel {
  AddressArgsModel({
    required this.color,
    required this.address,
  });

  final Color color;
  final AddressModel address;
}
