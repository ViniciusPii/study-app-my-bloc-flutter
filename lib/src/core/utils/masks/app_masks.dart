import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:superapp_my_bloc/src/core/utils/masks/mask_text_input_formatter.dart';
import 'package:superapp_my_bloc/src/core/utils/masks/number_decimal_input_formatter.dart';

class AppMasks {
  AppMasks._();

  static decimalMask({int? decimal, String? symbol}) => NumberDecimalInputFormatter(
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

  static String formatNumber<T>({
    required T value,
    int? decimal,
    String? symbol,
  }) =>
      NumberFormat.currency(
        name: symbol ?? '',
        locale: 'pt_Br',
        decimalDigits: decimal ?? 2,
      ).format(value);

  static unMaskNumber(String value) {
    return value.replaceAll(RegExp('[^0-9]'), '');
  }
}
