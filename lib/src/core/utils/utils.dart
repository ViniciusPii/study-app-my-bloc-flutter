import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/colors/app_colors.dart';

class Utils {
  Utils._();

  static Color getLuminance(Color color) =>
      color.computeLuminance() > 0.5 ? AppExtension.textColor : AppColors.white;

  static T getArgs<T>(BuildContext context) => ModalRoute.of(context)?.settings.arguments as T;
}
