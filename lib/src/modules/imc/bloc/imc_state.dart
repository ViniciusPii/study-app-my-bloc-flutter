part of 'imc_bloc.dart';

abstract class ImcState {
  ImcState({
    required this.imc,
    required this.result,
  });

  final double imc;
  final String result;
}

class ImcInitial extends ImcState {
  ImcInitial() : super(imc: 0, result: '');
}

class ImcLoading extends ImcState {
  ImcLoading() : super(imc: 0, result: '');
}

class ImcSuccess extends ImcState {
  ImcSuccess({
    required double imc,
    required String result,
  }) : super(imc: imc, result: result);
}

class ImcError extends ImcState {
  ImcError({
    required this.message,
  }) : super(imc: 0, result: '');

  final String message;
}
