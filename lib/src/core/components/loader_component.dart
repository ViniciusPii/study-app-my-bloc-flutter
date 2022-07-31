import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/three_bounce_component.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';
import 'package:superapp_my_bloc/src/core/theme/design_system/app_dimension.dart';

class LoaderComponent extends StatelessWidget {
  const LoaderComponent({
    Key? key,
    required this.child,
    required this.loading,
    this.size,
    this.color = AppExtension.primary,
  }) : super(key: key);

  final Color? color;
  final bool loading;
  final double? size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      replacement: child,
      child: SizedBox(
        height: AppDimension.size_6,
        child: ThreeBounceComponent(
          color: color,
          size: size ?? AppDimension.size_4,
        ),
      ),
    );
  }
}
