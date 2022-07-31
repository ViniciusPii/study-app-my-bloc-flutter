import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';

import 'app_extension.dart';
import 'design_system/app_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get defaultTheme => ThemeData(
        fontFamily: AppExtension.fontFamily,
        scaffoldBackgroundColor: AppExtension.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(
              double.infinity,
              AppDimension.size_5,
            ),
            textStyle: AppFonts.bodyLarge(),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppExtension.primary,
          secondary: AppExtension.secondary,
          onPrimary: Utils.getLuminance(AppExtension.primary),
        ),
      );
}
