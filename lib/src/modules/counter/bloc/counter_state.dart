part of 'counter_bloc.dart';

abstract class CounterState {
  CounterState({
    required this.counter,
  });

  final int counter;
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counter: 0);
}

class CounterLoading extends CounterState {
  CounterLoading({required int counter}) : super(counter: counter);
}

class CounterSuccess extends CounterState {
  CounterSuccess({required int counter}) : super(counter: counter);
}

class CounterError extends CounterState {
  CounterError({
    required this.message,
  }) : super(counter: 0);

  final String message;
}
