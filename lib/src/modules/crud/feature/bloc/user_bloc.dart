import 'package:superapp_my_bloc/src/core/infra/bloc.dart';
import 'package:superapp_my_bloc/src/modules/crud/models/user_model.dart';
import 'package:superapp_my_bloc/src/modules/crud/repositories/user/user_repository.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserState> {
  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(UserInitial());

  final UserRepository _userRepository;

  List<UserModel> _users = [];

  void getUsers() async {
    emit(UserLoading());
    await Future.delayed(const Duration(milliseconds: 800));

    _users = _userRepository.getUsers();

    emit(UserSuccess(user: _users));
  }

  void removeUsers(UserModel user) async {
    _users = _userRepository.removeUsers(user);
    emit(UserSuccess(user: _users));
  }

  void addUsers(UserModel user) async {
    emit(UserLoading());
    await Future.delayed(const Duration(milliseconds: 800));

    _users = _userRepository.addUsers(user);
    emit(UserSuccess(user: _users));
  }
}
