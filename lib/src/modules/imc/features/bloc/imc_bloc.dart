import 'package:superapp_my_bloc/src/core/infra/bloc.dart';

part 'imc_state.dart';

class ImcBloc extends Bloc<ImcState> {
  ImcBloc() : super(ImcInitial());

  void imcCalculate(double height, double weight) async {
    emit(ImcLoading());
    await Future.delayed(const Duration(milliseconds: 800));

    String result = '';
    double imc = weight / (height * height) * 100;

    if (imc < 18.5) {
      result = 'Abaixo do peso';
    } else if (imc <= 24.9) {
      result = 'Peso normal';
    } else if (imc <= 29.9) {
      result = 'Sobrepeso';
    } else if (imc <= 34.9) {
      result = 'Obesidade 1';
    } else if (imc <= 39.9) {
      result = 'Obesidade 2';
    } else {
      result = 'Obesidade 3';
    }

    emit(ImcSuccess(imc: imc, result: result));
  }
}
