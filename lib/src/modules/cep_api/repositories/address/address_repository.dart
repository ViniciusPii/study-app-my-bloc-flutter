import 'package:superapp_my_bloc/src/modules/cep_api/models/address_model.dart';

abstract class AddressRepository {
  Future<AddressModel> getAddress();
}
