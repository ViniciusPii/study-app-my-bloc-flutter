import 'package:flutter/services.dart';
import 'package:superapp_my_bloc/src/core/infra/utils/mask_text_input_formatter.dart';
import 'package:superapp_my_bloc/src/core/infra/utils/number_decimal_input_formatter.dart';

class AppMasks {
  AppMasks._();

  static NumberDecimalInputFormatter moneyMask = NumberDecimalInputFormatter(
    symbol: 'R\$',
    locale: 'pt_Br',
  );

  static NumberDecimalInputFormatter heightMask = NumberDecimalInputFormatter(
    symbol: '',
    locale: 'pt_Br',
  );

  static NumberDecimalInputFormatter weightMask = NumberDecimalInputFormatter(
    symbol: '',
    locale: 'pt_Br',
  );

  static NumberDecimalInputFormatter onlyNumbersMask = NumberDecimalInputFormatter(
    symbol: '',
    locale: 'pt_Br',
    decimalDigits: 0,
  );

  static MaskTextInputFormatter cepMask = MaskTextInputFormatter(
    mask: '#####-###',
  );

  static FilteringTextInputFormatter onlyLetters = FilteringTextInputFormatter.allow(
    RegExp('[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+|s'),
  );
}
