import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/theme/app_colors.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';

class Utils {
  Utils._();

  static Color getLuminance(Color color) =>
      color.computeLuminance() > 0.5 ? AppExtension.textColor : AppColors.white;

  static Color getColorArgs(BuildContext context) =>
      ModalRoute.of(context)?.settings.arguments as Color;
}
