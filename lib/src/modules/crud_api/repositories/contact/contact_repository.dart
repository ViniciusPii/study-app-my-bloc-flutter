import 'package:superapp_my_bloc/src/modules/crud_api/models/contact_model.dart';

abstract class ContactRepository {
  Future<List<ContactModel>> getContacts();
}
