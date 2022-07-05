import 'package:superapp_my_bloc/src/core/bloc/bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/models/contact_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/repositories/contact/contact_repository.dart';

part 'contact_update_state.dart';

class ContactUpdateBloc extends Bloc<ContactUpdateState> {
  ContactUpdateBloc({
    required ContactRepository contactRepository,
  })  : _contactRepository = contactRepository,
        super(ContactUpdateInitial());

  final ContactRepository _contactRepository;

  void updateContact(ContactModel contact) async {
    emit(ContactUpdateLoading());
    await Future.delayed(const Duration(milliseconds: 800));
    await _contactRepository.updateContact(contact);
    emit(ContactUpdateSuccess());
  }
}
