import 'package:superapp_my_bloc/src/core/bloc/bloc.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/models/address_model.dart';
import 'package:superapp_my_bloc/src/modules/cep_api/repositories/address/address_repository.dart';

part 'address_state.dart';

class AddressBloc extends Bloc<AddressState> {
  AddressBloc({
    required AddressRepository addressRepository,
  })  : _addressRepository = addressRepository,
        super(AddressInitial());

  final AddressRepository _addressRepository;

  void getAddress() async {
    emit(AddressLoading());
    final address = await _addressRepository.getAddress();
    emit(AddressSuccess(address: address));
  }
}
