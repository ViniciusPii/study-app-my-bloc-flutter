import 'dart:developer' as log;
import 'dart:math';

import 'package:flutter/material.dart';

class AppColorGenerate {
  AppColorGenerate._();

  static MaterialColor color(int color) {
    return MaterialColor(
      Color(color).value,
      <int, Color>{
        //shades 25%
        50: _tintColor(Color(color), 0.95),
        100: _tintColor(Color(color), 0.9),
        200: _tintColor(Color(color), 0.75),
        300: _tintColor(Color(color), 0.5),
        400: _tintColor(Color(color), 0.25),
        500: Color(color),
        600: _shadeColor(Color(color), 0.2),
        700: _shadeColor(Color(color), 0.4),
        800: _shadeColor(Color(color), 0.6),
        900: _shadeColor(Color(color), 0.8),

        // ligh shades
        // 50: tintColor(Color(color), 0.874),
        // 100: tintColor(Color(color), 0.8),
        // 200: tintColor(Color(color), 0.6),
        // 300: tintColor(Color(color), 0.4),
        // 400: tintColor(Color(color), 0.2),
        // 500: Color(color),
        // 600: shadeColor(Color(color), 0.1),
        // 700: shadeColor(Color(color), 0.2),
        // 800: shadeColor(Color(color), 0.3),
        // 900: shadeColor(Color(color), 0.4),
      },
    );
  }

  static final List<int> _shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

  static generateLogColor(int hexa, String colorName) {
    MaterialColor colorLog = color(hexa);

    log.log('''
      static const Color $colorName = ${colorLog[_shades[5]]};
      static const Color $colorName${_shades[0]} = ${colorLog[_shades[0]]};
      static const Color $colorName${_shades[1]} = ${colorLog[_shades[1]]};
      static const Color $colorName${_shades[2]} = ${colorLog[_shades[2]]};
      static const Color $colorName${_shades[3]} = ${colorLog[_shades[3]]};
      static const Color $colorName${_shades[4]} = ${colorLog[_shades[4]]};
      static const Color $colorName${_shades[5]} = ${colorLog[_shades[5]]};
      static const Color $colorName${_shades[6]} = ${colorLog[_shades[6]]};
      static const Color $colorName${_shades[7]} = ${colorLog[_shades[7]]};
      static const Color $colorName${_shades[8]} = ${colorLog[_shades[8]]};
      static const Color $colorName${_shades[9]} = ${colorLog[_shades[9]]};
    ''');
  }

  static generateLogMaterialColor(int hexa, String colorName) {
    MaterialColor colorLog = color(hexa);

    log.log('''
      static MaterialColor $colorName = const MaterialColor(
        $hexa,
        {
          50: ${colorLog[_shades[0]]},
          100: ${colorLog[_shades[1]]},
          200: ${colorLog[_shades[2]]},
          300: ${colorLog[_shades[3]]},
          400: ${colorLog[_shades[4]]},
          500: ${colorLog[_shades[5]]},
          600: ${colorLog[_shades[6]]},
          700: ${colorLog[_shades[7]]},
          800: ${colorLog[_shades[8]]},
          900: ${colorLog[_shades[9]]},
        },
      );
    ''');
  }

  static int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color _tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);

  static int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1);
}
