import 'package:superapp_my_bloc/src/core/infra/bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/models/contact_model.dart';
import 'package:superapp_my_bloc/src/modules/crud_dartion/repositories/contact/contact_repository.dart';

part 'contact_update_state.dart';

class ContactUpdateBloc extends Bloc<ContactUpdateState> {
  ContactUpdateBloc({
    required ContactRepository contactRepository,
  })  : _contactRepository = contactRepository,
        super(ContactUpdateInitial());

  final ContactRepository _contactRepository;

  Future<void> updateContact(ContactModel contact) async {
    emit(ContactUpdateLoading());
    await Future.delayed(const Duration(milliseconds: 800));
    try {
      await _contactRepository.updateContact(contact);
      emit(ContactUpdateSuccess());
    } on Exception {
      emit(ContactUpdateError(message: 'Erro ao atualizar o contato!'));
    }
  }
}
