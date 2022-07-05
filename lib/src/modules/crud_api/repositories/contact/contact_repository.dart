import 'package:superapp_my_bloc/src/modules/crud_api/models/contact_model.dart';

abstract class ContactRepository {
  Future<List<ContactModel>> getContacts();
  Future<void> addContact(ContactModel contact);
  Future<void> updateContact(ContactModel contact);
  Future<void> removeContact(ContactModel contact);
}
