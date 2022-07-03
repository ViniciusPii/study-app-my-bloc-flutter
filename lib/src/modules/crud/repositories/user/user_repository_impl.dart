import 'package:superapp_my_bloc/src/modules/crud/models/user_model.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final List<UserModel> _users = [
    UserModel(name: 'Fulano'),
    UserModel(name: 'Ciclano'),
    UserModel(name: 'Beltrano'),
  ];

  @override
  List<UserModel> addUsers(UserModel user) {
    _users.add(user);
    return _users;
  }

  @override
  List<UserModel> getUsers() {
    return _users;
  }

  @override
  List<UserModel> removeUsers(UserModel user) {
    _users.remove(user);
    return _users;
  }
}
