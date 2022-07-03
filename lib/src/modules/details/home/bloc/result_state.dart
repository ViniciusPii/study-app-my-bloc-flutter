part of 'result_bloc.dart';

abstract class ResultState {
  ResultState({
    required this.result,
  });

  final int result;
}

class ResultInitial extends ResultState {
  ResultInitial() : super(result: 0);
}

class ResultLoading extends ResultState {
  ResultLoading() : super(result: 0);
}

class ResultSuccess extends ResultState {
  ResultSuccess({required int result}) : super(result: result);
}

class ResultError extends ResultState {
  ResultError({
    required this.message,
  }) : super(result: 0);

  final String message;
}
