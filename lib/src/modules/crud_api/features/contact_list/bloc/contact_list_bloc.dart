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

  List<ContactModel> _contacts = [];

  void getContacts() async {
    emit(ContactListLoading());
    await Future.delayed(const Duration(milliseconds: 800));
    _contacts = await _contactRepository.getContacts();
    emit(ContactListSuccess(contacts: _contacts));
  }
}
