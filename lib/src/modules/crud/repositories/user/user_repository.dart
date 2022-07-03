import 'package:superapp_my_bloc/src/modules/crud/models/user_model.dart';

abstract class UserRepository {
  List<UserModel> getUsers();
  List<UserModel> addUsers(UserModel user);
  List<UserModel> removeUsers(UserModel user);
}
