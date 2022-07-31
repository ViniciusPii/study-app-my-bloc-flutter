import 'package:flutter/services.dart';
import 'package:superapp_my_bloc/src/core/infra/utils/masks/mask_text_input_formatter.dart';
import 'package:superapp_my_bloc/src/core/infra/utils/masks/number_decimal_input_formatter.dart';

class AppMasks {
  AppMasks._();

  static final money = NumberDecimalInputFormatter(symbol: 'R\$');
  static final twoDecimal = NumberDecimalInputFormatter(symbol: '');
  static final onlyNumbers = NumberDecimalInputFormatter(symbol: '', decimalDigits: 0);

  static final cep = MaskTextInputFormatter(mask: '#####-###');

  static final onlyLetters = FilteringTextInputFormatter.allow(
    RegExp('[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+|s'),
  );
}
