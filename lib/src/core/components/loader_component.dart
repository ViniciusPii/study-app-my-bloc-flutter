import 'package:flutter/material.dart';
import 'package:superapp_my_bloc/src/core/components/three_bounce_component.dart';

import 'package:superapp_my_bloc/src/core/theme/app_dimension.dart';

class LoaderComponent extends StatelessWidget {
  const LoaderComponent({
    Key? key,
    required this.color,
    required this.loading,
    required this.child,
    this.size,
  }) : super(key: key);

  final Color color;
  final bool loading;
  final double? size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      replacement: child,
      child: ThreeBounceComponent(
        color: color,
        size: size ?? AppDimension.size_4,
      ),
    );
  }
}
