import 'package:dio/dio.dart';
import 'package:superapp_my_bloc/src/modules/crud_api/models/contact_model.dart';

import 'contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  ContactRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  final String _baseUrl = 'http://10.0.2.2:3031/contacts';

  @override
  Future<List<ContactModel>> getContacts() async {
    final response = await _dio.get(_baseUrl);
    return response.data.map<ContactModel>((contact) => ContactModel.fromMap(contact)).toList();
  }
}
