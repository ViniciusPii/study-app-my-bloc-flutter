import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppMasks {
  AppMasks._();

  static decimalMask({int? decimal, String? symbol}) => CurrencyTextInputFormatter(
        symbol: symbol ?? '',
        locale: 'pt_Br',
        decimalDigits: decimal ?? 2,
      );

  static final cepMask = MaskTextInputFormatter(
    mask: '#####-###',
  );

  static FilteringTextInputFormatter onlyLetters = FilteringTextInputFormatter.allow(
    RegExp('[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+|s'),
  );

  static unMaskNumber(String value) {
    return value.replaceAll(RegExp('[^0-9]'), '');
  }
}
