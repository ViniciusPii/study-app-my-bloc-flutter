import 'package:dio/dio.dart';

import 'package:superapp_my_bloc/src/modules/cep_api/models/address_model.dart';

import 'address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<AddressModel> getAddress() async {
    final response = await _dio.get('https://viacep.com.br/ws/01001000/json/');
    final address = AddressModel.fromMap(response.data);
    return address;
  }
}
