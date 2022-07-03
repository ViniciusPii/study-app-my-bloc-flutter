import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';

class BaseViewComponent extends StatelessWidget {
  const BaseViewComponent({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimension.size_2,
        horizontal: AppDimension.size_3,
      ),
      child: child,
    );
  }
}
