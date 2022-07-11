import 'package:flutter/material.dart';

import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_fonts.dart';
import 'package:superapp_my_bloc/src/core/utils/utils.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    Key? key,
    required this.color,
    required this.title,
    required this.func,
  }) : super(key: key);

  final Color color;
  final String title;
  final void Function() func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimension.size_2,
            horizontal: AppDimension.size_3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: AppFonts.titleLarge(
                    color: Utils.getLuminance(color),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_right_outlined,
                color: Utils.getLuminance(color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
