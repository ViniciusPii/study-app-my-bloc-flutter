import 'package:superapp_my_bloc/src/core/bloc/bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/models/contact_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/repositories/contact/contact_repository.dart';

part 'contact_list_state.dart';

class ContactListBloc extends Bloc<ContactListState> {
  ContactListBloc({
    required ContactRepository contactRepository,
  })  : _contactRepository = contactRepository,
        super(ContactListInitial());

  final ContactRepository _contactRepository;

  void getContacts() async {
    emit(ContactListLoading());
    await Future.delayed(const Duration(milliseconds: 800));
    final contacts = await _contactRepository.getContacts();
    _orderByList(contacts);
    emit(ContactListSuccess(contacts: contacts));
  }

  void removeContact(ContactModel contact) async {
    await _contactRepository.removeContact(contact);
    getContacts();
  }

  void _orderByList(List<ContactModel> contacts) {
    return contacts.sort(
      (contactFirst, contactLast) => contactLast.timestamp.compareTo(
        contactFirst.timestamp,
      ),
    );
  }
}
