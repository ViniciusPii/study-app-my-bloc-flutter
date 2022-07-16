import 'package:superapp_my_bloc/src/core/infra/bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/models/contact_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/repositories/contact/contact_repository.dart';

part 'contact_register_state.dart';

class ContactRegisterBloc extends Bloc<ContactRegisterState> {
  ContactRegisterBloc({
    required ContactRepository contactRepository,
  })  : _contactRepository = contactRepository,
        super(ContactRegisterInitial());

  final ContactRepository _contactRepository;

  Future<void> addContact(ContactModel contact) async {
    emit(ContactRegisterLoading());
    await Future.delayed(const Duration(milliseconds: 800));
    try {
      await _contactRepository.addContact(contact);
      emit(ContactRegisterSuccess());
    } on Exception {
      emit(ContactRegisterError(message: 'Erro ao cadastrar contato!'));
    }
  }
}
