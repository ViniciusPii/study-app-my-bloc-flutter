import 'package:superapp_my_bloc/src/core/infra/bloc.dart';

part 'result_state.dart';

class ResultBloc extends Bloc<ResultState> {
  ResultBloc() : super(ResultInitial());

  void calculate(int first, int second) async {
    emit(ResultLoading());
    await Future.delayed(const Duration(milliseconds: 800));

    int result = first + second;

    emit(ResultSuccess(result: result));
  }
}
