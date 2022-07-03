part of 'address_bloc.dart';

abstract class AddressState {
  AddressState({
    required this.address,
  });

  final AddressModel address;
}

class AddressInitial extends AddressState {
  AddressInitial() : super(address: AddressModel.addressEmpty);
}

class AddressLoading extends AddressState {
  AddressLoading() : super(address: AddressModel.addressEmpty);
}

class AddressSuccess extends AddressState {
  AddressSuccess({required AddressModel address}) : super(address: address);
}

class AddressError extends AddressState {
  AddressError({
    required this.message,
  }) : super(address: AddressModel.addressEmpty);

  final String message;
}
